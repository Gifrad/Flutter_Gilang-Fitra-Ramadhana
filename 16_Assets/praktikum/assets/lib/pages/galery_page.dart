import 'package:assets/data/data_image.dart';
import 'package:flutter/material.dart';

import 'detail_image.dart';

class GaleryPage extends StatelessWidget {
  const GaleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GERAKAN SOLAT'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          final data = dataImage.elementAt(index);
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailImage(data)));
            },
            child: Card(
              borderOnForeground: true,
              margin: const EdgeInsets.only(top: 16, right: 6, left: 6),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Column(
                children: [
                   Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Text(
                      '(${data.positionNumber.toString()})',
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blue, style: BorderStyle.solid),
                    ),
                    child: Image.asset(data.image, fit: BoxFit.fill),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: Text(
                      data.desc,
                      style:
                          const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: dataImage.length,
      ),
    );
  }
}
