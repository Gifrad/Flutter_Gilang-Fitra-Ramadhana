import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Contact extends StatelessWidget {
  final String firstWord;
  final String name;
  final String number;

  const Contact(
      {super.key,
      required this.name,
      required this.number,
      required this.firstWord});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(25),
              border: Border.all(),
            ),
            child: Center(
                child: Text(
              firstWord,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            )),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(number)
            ],
          )
        ],
      ),
    );
  }
}
