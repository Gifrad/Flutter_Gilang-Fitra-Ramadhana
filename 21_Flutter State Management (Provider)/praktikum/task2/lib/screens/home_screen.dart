import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/provider/contact_provider.dart';
import 'package:task2/screens/add_screen.dart';
import 'package:task2/screens/widget/contact_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.add),
            ),
            onTap: () {
              final contactProvider =
                  Provider.of<ContactProvider>(context, listen: false);
                Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddScreen(manager: contactProvider),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<ContactProvider>(
        builder: (context, value, child) => ContactList(manager: value),
      ),
    );
  }
}
