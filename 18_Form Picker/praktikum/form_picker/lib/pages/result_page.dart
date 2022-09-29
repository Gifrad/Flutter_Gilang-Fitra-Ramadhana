import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_picker/widget/my_file_picker.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.gambar,
    required this.date,
    required this.text,
    this.warna,
  });

  final String gambar;
  final String date;
  final Color? warna;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(gambar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Text(
                  'Published: $date',
                ),
                const SizedBox(
                  width: 60,
                ),
                const Text(
                  'Color :',
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration:
                      BoxDecoration(color: warna, shape: BoxShape.circle),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
