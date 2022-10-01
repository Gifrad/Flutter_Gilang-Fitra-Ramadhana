import 'dart:math';

import 'package:flutter/material.dart';
import 'package:form_input_button/src/models/people.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Contact extends StatelessWidget {
  final People contact;
   Contact(this.contact, {super.key});
 static List<People> dataPeople = [
    People(name: 'Jurgen Kloop', phoneNumber: '0000000001'),
    People(name: 'Sadio Mane', phoneNumber: '0000000002'),
    People(name: 'Muhammed Salah', phoneNumber: '0000000003'),
    People(name: 'Darwin Nunez', phoneNumber: '0000000004'),
    People(name: 'Thiago Alcantara', phoneNumber: '0000000005'),
    People(name: 'Luis Diaz', phoneNumber: '0000000006'),
    People(name: 'Rebertson', phoneNumber: '0000000007'),
    People(name: 'Roberto Firminho', phoneNumber: '0000000008'),
    People(name: 'Trent Alexander Arnold', phoneNumber: '0000000009'),
    People(name: 'Fabinho', phoneNumber: '00000000010'),
  ];

  final Color _randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: SizedBox(
                width: 62,
                height: 62,
                child: CircleAvatar(
                  backgroundColor: _randomColor,
                  child: Text(
                    contact.name[0].toUpperCase(),
                    style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8, left: 8),
                  child: Text(
                    contact.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4, left: 8),
                  child: Text(
                    contact.phoneNumber,
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child:
                        const Icon(Icons.call, color: Colors.green, size: 30),
                    onTap: () {
                      launchUrlString('tel:${contact.phoneNumber}');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child:
                        const Icon(Icons.message, color: Colors.blue, size: 30),
                    onTap: () {
                      launchUrlString('sms:${contact.phoneNumber}');
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
