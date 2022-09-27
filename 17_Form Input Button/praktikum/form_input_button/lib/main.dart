import 'package:flutter/material.dart';
import 'package:form_input_button/src/pages/contact_page.dart';
import 'package:form_input_button/src/pages/form_add_contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Section 17 Form Input Button',
      debugShowCheckedModeBanner: false,
      initialRoute: ContactPage.routeName,
      routes: {
        ContactPage.routeName: (context) => const ContactPage(),
        FormAddContact.routeName: (context) => const FormAddContact(),
      },
    );
  }
}
