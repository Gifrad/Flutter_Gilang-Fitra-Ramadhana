import 'package:flutter/material.dart';
import 'package:weekly1/pages/home/widget/banner_home.dart';
import 'package:weekly1/pages/home/widget/form_input_person.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu,color: Colors.black,),
            ),
          )
        ],
      ),
      body: ListView(
        children: const [
          BannerHome(),
          FormInputPersonal(),
        ],
      ),
    );
  }
}
