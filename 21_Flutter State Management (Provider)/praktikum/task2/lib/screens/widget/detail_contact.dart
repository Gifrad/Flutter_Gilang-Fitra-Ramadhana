import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../models/people.dart';

class DetailContact extends StatelessWidget {
  const DetailContact({super.key, required this.data});
  final People data;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Container(
            height: 128,
            width: 128,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
            ),
            child: Center(child: Text(
                data.name[0],
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            data.name,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            data.numberPhone,
            style: const TextStyle(fontSize: 22),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: (){
                launchUrlString('tel://${data.numberPhone}');
              }, icon: const Icon(Icons.phone)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: (){
                launchUrlString('sms://${data.numberPhone}');
              }, icon: const Icon(Icons.message)),
            ),
          ],)
        ],
      ),
    );
  }
}