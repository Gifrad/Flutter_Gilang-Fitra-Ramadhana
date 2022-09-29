import 'package:flutter/material.dart';

class MyDescription extends StatefulWidget {
  const MyDescription(BuildContext context, {super.key});

  @override
  State<MyDescription> createState() => _MyDescriptionState();
}

class _MyDescriptionState extends State<MyDescription> {
  // TextEditingController desc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return description();
  }

  Widget description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 0.3,
          color: Colors.black,
        ),
        const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        // TextFormField(
        //   controller: desc,
        //   maxLines: 5,
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
