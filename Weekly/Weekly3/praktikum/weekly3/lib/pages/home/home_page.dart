import 'package:flutter/material.dart';
import 'package:weekly3/pages/user/user_data_page.dart';

import 'widget/about_us.dart';
import 'widget/banner_home.dart';
import 'widget/drawer_widget.dart';
import 'widget/form_input_person.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: ListView(
        children: const [
          BannerHome(),
          FormInputPersonal(),
          AboutUsWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const UserDataPage(),
                    ),
                    (route) => false);
              },
              child: const Icon(Icons.message),
            ),
            label: 'Message',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.deepPurpleAccent[700],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.blueGrey[50],
        elevation: 4,
      ),
    );
  }
}
