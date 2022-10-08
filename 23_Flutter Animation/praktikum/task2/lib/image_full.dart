import 'package:flutter/material.dart';

class ImageFull extends StatefulWidget {
  final String asset;
  const ImageFull({super.key, required this.asset});

  @override
  State<ImageFull> createState() => _ImageFullState();
}

class _ImageFullState extends State<ImageFull> {
  bool isFull = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Full Screen Page'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: InkWell(
            onTap: () => setState(() {
              isFull = !isFull;
            }),
            child: AnimatedContainer(
              width: isFull ? 600 : 200,
              height: isFull ? 600 : 200,
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.asset),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
