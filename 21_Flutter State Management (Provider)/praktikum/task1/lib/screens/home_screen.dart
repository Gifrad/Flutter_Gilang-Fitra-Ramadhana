import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task1/model/utils.dart';
import 'package:task1/screens/add_contact.dart';
import 'package:task1/data/contact.dart';
import 'package:task1/screens/edit_contact.dart';
import '../model/people.dart';

class HomeScreen extends StatefulWidget {
  static const routName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color _randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  final dataContact = Contact.dataPeople;

  //sort
  void ascSort() {
    dataContact
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  //add
  void newPeople(People data) {
    setState(() {
      dataContact.add(data);
    });
  }

  //remove
  void removePeople(int index) {
    setState(() {
      dataContact.removeAt(index);
    });
  }

  //edit
  late int indexAt;
  void editPeople(People data) {
    setState(() {
      dataContact[indexAt].name = data.name;
      dataContact[indexAt].numberPhone = data.numberPhone;
    });
  }

  @override
  Widget build(BuildContext context) {
    ascSort();
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
                AddContact.routName,
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
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: _randomColor,
              child: Text(
                data.name[0].toUpperCase(),
                // Contact.dataPeople[index].name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              data.name,
              // Contact.dataPeople[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(data.numberPhone),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete The Data?'),
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
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      },
                    ).then((value) {
                      if (value == false) {
                        return;
                      } else {
                        removePeople(index);
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
                          title: const Text('Do you want Edit the data?'),
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
                              child: const Text('Edit'),
                            ),
                          ],
                        );
                      },
                    ).then((value) {
                      if (value == false) {
                        return;
                      } else {
                        setState(() {
                          indexAt = index;
                        });
                        Navigator.of(context).pushNamed(
                          EditContact.routName,
                          arguments: Utils(
                            currentPeople: dataContact[index],
                            editContact: editPeople,
                          ),
                        );
                      }
                    });
                  },
                  icon: const Icon(Icons.edit),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
