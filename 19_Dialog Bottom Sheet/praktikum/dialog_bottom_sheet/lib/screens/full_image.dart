import 'package:flutter/material.dart';

class FullImage extends StatelessWidget {
  const FullImage({super.key, required this.full, required this.namePostion});

  final String full;
  final String namePostion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text(namePostion),),
      body: Center(
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(full),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
