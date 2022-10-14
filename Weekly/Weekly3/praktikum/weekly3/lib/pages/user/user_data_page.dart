import 'package:flutter/material.dart';
import 'package:weekly3/pages/home/home_page.dart';
import 'package:weekly3/pages/user/widget/user_list.dart';

import '../home/widget/drawer_widget.dart';

class UserDataPage extends StatelessWidget {
  const UserDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerWidget(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
        elevation: 4,
        backgroundColor: Colors.white,
      ),
      body: const UserList(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ), (route) => false);
              },
              child: const Icon(Icons.home),
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.deepPurpleAccent[700],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.blueGrey[50],
        elevation: 4,
      ),
    );
  }
}
