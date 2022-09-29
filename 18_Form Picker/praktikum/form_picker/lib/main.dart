import 'package:flutter/material.dart';
import 'package:form_picker/pages/form_page.dart';
import 'package:form_picker/pages/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FromPage() ,
    );
  }
}
