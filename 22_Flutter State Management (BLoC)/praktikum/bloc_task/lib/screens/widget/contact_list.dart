import 'dart:math';

import 'package:bloc_task/bloc/contact_bloc.dart';
import 'package:flutter/material.dart';

import '../edit_screen.dart';
import 'detail_contact.dart';

class ContactList extends StatelessWidget {
  final ContactBloc bloc;
  const ContactList({super.key, required this.bloc});

  void ascSort() {
    bloc.state.contacts
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  @override
  Widget build(BuildContext context) {
    ascSort();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: bloc.state.contacts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: ListTile(
              onTap: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  context: context,
                  builder: (context) =>
                      DetailContact(contact: bloc.state.contacts[index]),
                );
              },
              leading: CircleAvatar(
                backgroundColor:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                child: Text(bloc.state.contacts[index].name[0].toUpperCase()),
              ),
              title: Text(bloc.state.contacts[index].name),
              subtitle: Text(bloc.state.contacts[index].numberPhone),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Ingin menghapus data'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: const Text('Delete'),
                              ),
                            ],
                          );
                        },
                      ).then((value) {
                        if (value == false) {
                          return;
                        } else {
                          bloc.add(RemoveContact(index: index));
                        }
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Do you want to edit?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      ).then((value) {
                        if (value == false) {
                          return;
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditScreen(
                                index: index,
                                bloc: bloc,
                              ),
                            ),
                          );
                        }
                      });
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 5,
        ),
      ),
    );
  }
}
