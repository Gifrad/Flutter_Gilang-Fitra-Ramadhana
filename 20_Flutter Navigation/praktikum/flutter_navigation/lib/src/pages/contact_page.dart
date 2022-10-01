import 'package:flutter/material.dart';
import '../models/people.dart';
import '../widget/contact.dart';
import 'form_add_contact.dart';


class ContactPage extends StatefulWidget {
  static const routeName = '/contact';
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final dataContact = Contact.dataPeople;

  void newPeople(People data) {
    setState(() {
      dataContact.add(data);
    });
  }

  void sortAsc(){
     dataContact.sort((a, b) => a.name.compareTo(b.name),);
  }

  @override
  Widget build(BuildContext context) {
    sortAsc();
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.add),
            ),
            onTap: () async {
              await Navigator.of(context).pushNamed(
                FormAddContact.routeName,
                arguments: newPeople,
              );
            },
          ),
        ],
        centerTitle: true,
        title: const Text(
          'CONTACT',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: dataContact.length,
        itemBuilder: (context, index) {
          final data = dataContact.elementAt(index);
          return Contact(data);
        },
      ),
    );
  }
}
