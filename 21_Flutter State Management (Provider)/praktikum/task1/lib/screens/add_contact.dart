import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/people.dart';

class AddContact extends StatefulWidget {
  static const routName = '/add';
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController number = TextEditingController();
  final dataNewPeople = {'name': '', 'phoneNumber': ''};

  late Function(People) newContatc;
  @override
  Widget build(BuildContext context) {
    newContatc = ModalRoute.of(context)!.settings.arguments as Function(People);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Contact'),
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
                    final newPeople = People(
                      name: dataNewPeople['name']!,
                      numberPhone: dataNewPeople['phoneNumber']!,
                    );
                    newContatc(newPeople);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                    Navigator.of(context).pop(context);
                  }
                },
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
