import 'package:flutter/material.dart';
import 'package:task1/screens/add_contact.dart';
import 'package:task1/screens/edit_contact.dart';
import 'package:task1/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName :(context) => const HomeScreen(),
        AddContact.routName :(context) => const AddContact(),
        EditContact.routName :(context) => const EditContact(),
      },
    );
  }
}

