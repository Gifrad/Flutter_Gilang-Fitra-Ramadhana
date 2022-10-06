import 'package:bloc_task/bloc/contact_bloc.dart';
import 'package:bloc_task/screens/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/contact_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ContactBloc>(context, listen: false);
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddScreen(bloc: bloc),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is Failed) {
            return const Scaffold(
              body: Center(
                child: Text('Failed'),
              ),
            );
          }
          if (state.contacts.isEmpty) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Your Contact Is Empty',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.group,
                  size: 40,
                  color: Colors.grey,
                ),
              ],
            ));
          }
          return ContactList(bloc: bloc);
        },
      ),
    );
  }
}
