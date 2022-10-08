import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bloc/contact_bloc.dart';
import '../models/contact_model.dart';

class EditScreen extends StatelessWidget {
  final int index;
  final ContactBloc bloc;
  const EditScreen({super.key, required this.index, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController name = TextEditingController();
    final TextEditingController number = TextEditingController();
    final dataNewPeople = {'name': '', 'phoneNumber': ''};
    name.text = bloc.state.contacts[index].name;
    number.text = bloc.state.contacts[index].numberPhone;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Contact'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  prefixIcon: const Icon(Icons.people),
                  label: const Text('Name'),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Please... Input your Name!';
                  } else if (value != null) {
                    if (value.length < 3) {
                      return 'Your name min.3 Character';
                    }
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  if (newValue != null) dataNewPeople['name'] = newValue;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                maxLength: 10,
                controller: number,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  prefixIcon: const Icon(Icons.numbers),
                  label: const Text('Number'),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Please... Input your Number!';
                  } else if (value != null) {
                    if (value.length < 10 || value.length > 10) {
                      return 'Must be 10 Number';
                    }
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  if (newValue != null) dataNewPeople['phoneNumber'] = newValue;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    final newPeople = ContactModel(
                      name: dataNewPeople['name']!,
                      numberPhone: dataNewPeople['phoneNumber']!,
                    );
                    final sameNumber = bloc.state.contacts
                        .where((element) =>
                            element.numberPhone == newPeople.numberPhone)
                        .isNotEmpty;
                    if (sameNumber) {
                      bloc.add(FailedContact());
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('number already exists'),
                        ),
                      );
                    } else {
                      bloc.add(EditContact(contact: newPeople, index: index));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                        ),
                      );
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
