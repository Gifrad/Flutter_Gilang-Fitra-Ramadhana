import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'barcode.dart';

class MyBadge extends StatelessWidget {
  const MyBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BADGES'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 250),
        child: Column(
          children: [
            const Chip(
                padding: EdgeInsets.all(0),
                backgroundColor: Colors.deepPurple,
                label: Text(
                  'BADGE',
                  style: TextStyle(color: Colors.white),
                )),
            Center(
              child: Badge(
                shape: BadgeShape.square,
                badgeColor: Colors.deepPurple,
                borderRadius: BorderRadius.circular(8),
                badgeContent: const Text(
                  'BADGE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 200)),
            SizedBox(
              width: 200,
              height: 51,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BarcodeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Go To Barcode',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
