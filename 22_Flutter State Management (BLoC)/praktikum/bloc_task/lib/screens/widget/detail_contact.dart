import 'dart:math';
import 'package:bloc_task/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailContact extends StatelessWidget {
  final ContactModel contact;
  const DetailContact({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                contact.name[0],
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
            contact.name,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            contact.numberPhone,
            style: const TextStyle(fontSize: 22),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: (){
                launchUrlString('tel://${contact.numberPhone}');
              }, icon: const Icon(Icons.phone)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: (){
                launchUrlString('sms://${contact.numberPhone}');
              }, icon: const Icon(Icons.message)),
            ),
          ],)
        ],
      ),
    );
  }
}