import 'dart:math';
import 'package:flutter/material.dart';
import 'package:task2/screens/edit_screen.dart';
import '../../provider/contact_provider.dart';
import 'detail_contact.dart';

class ContactList extends StatelessWidget {
  final ContactProvider manager;
  const ContactList({super.key, required this.manager});

  void ascSort() {
    manager.contacts.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  @override
  Widget build(BuildContext context) {
    ascSort();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: manager.contacts.length,
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
                      DetailContact(data: manager.contacts[index]),
                );
              },
              leading: CircleAvatar(
                backgroundColor:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                child: Text(
                  manager.contacts[index].name[0].toUpperCase(),
                ),
              ),
              title: Text(
                manager.contacts[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(manager.contacts[index].numberPhone),
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
                          manager.removeContact(index);
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
                                  manager: manager,
                                ),
                              ),
                            );
                          }
                        });
                      },
                      icon: const Icon(Icons.edit))
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
