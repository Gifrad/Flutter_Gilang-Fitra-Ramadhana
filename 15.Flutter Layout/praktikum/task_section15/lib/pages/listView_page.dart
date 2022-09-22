import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task_section15/widget/contact.dart';

import 'GridPageView.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Json ListView in Flutter',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: const [
          Contact(name: 'Jurgen Kloop', number: '+62123456789', firstWord: 'J'),
          Contact(name: 'Sadio Mane', number: '+62123456789', firstWord: 'S'),
          Contact(
              name: 'Mohammed Salah', number: '+62123456789', firstWord: 'M'),
          Contact(name: 'Darwin Nunez', number: '+62123456789', firstWord: 'D'),
          Contact(
              name: 'Thiago Alcantara', number: '+62123456789', firstWord: 'T'),
          Contact(
              name: 'Trent Alexander Arnold',
              number: '+62123456789',
              firstWord: 'T'),
          Contact(name: 'Luis Diaz', number: '+62123456789', firstWord: 'L'),
          Contact(name: 'Robertson', number: '+62123456789', firstWord: 'R'),
          Contact(
              name: 'Roberto Firminho', number: '+62123456789', firstWord: 'R'),
          Contact(name: 'Fabinho', number: '+62123456789', firstWord: 'F'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black45,
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.contact_page), label: 'Contact'),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const GridPageView()),
                      (Route<dynamic> route) => false);
                },
                child: const Icon(Icons.grid_view),
              ),
              label: 'Icons')
        ],
      ),
    );
  }
}
