import 'package:assets/models/image.dart';
import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final ImageModel data;
  const DetailImage(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '(${data.desc.toUpperCase()})',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            data.image,
            fit: BoxFit.fill,
          )),
    );
  }
}
