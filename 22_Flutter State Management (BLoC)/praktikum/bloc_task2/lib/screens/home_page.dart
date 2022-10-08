import 'package:bloc_task2/bloc/theme_bloc/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc.dart';
import '../bloc/theme_bloc/bloc/theme_event.dart';
import '../bloc/theme_bloc/bloc/theme_state.dart';
import 'add_screen.dart';
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
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {         
                    context.read<ThemeBloc>().add(ThemeChange());  
                  },
                  child: const Icon(Icons.dark_mode),
                ),
              );
            },
          ),
          InkWell(
            child: const Padding(
              padding: EdgeInsets.only(right: 34),
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
