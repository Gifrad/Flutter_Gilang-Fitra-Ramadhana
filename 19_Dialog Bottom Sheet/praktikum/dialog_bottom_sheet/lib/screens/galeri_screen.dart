import 'package:dialog_bottom_sheet/models/image_model.dart';
import 'package:dialog_bottom_sheet/screens/full_image.dart';
import 'package:flutter/material.dart';

class GaleryScreen extends StatelessWidget {
  const GaleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GERAKAN SOLAT'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: dataImage.length,
        itemBuilder: ((context, index) {
          final data = dataImage.elementAt(index);
          return InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) => Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(data.image),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: const Text(
                                        'Ingin Tampilkan Layar Penuh?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('No')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => FullImage(full: data.image, namePostion: data.desc),
                                              ),
                                            );
                                          },
                                          child: const Text('Yes')),
                                    ],
                                  ));
                        },
                        child: const Text(
                          'Tampilkan Layar Penuh',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        )),
                  ],
                ),
              );
            },
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Text(
                          '(${data.positionNumber.toString()})',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 4, right: 16, left: 16),
                        width: double.maxFinite,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blue, style: BorderStyle.solid),
                        ),
                        child: Image.asset(data.image, fit: BoxFit.fill),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2, bottom: 4),
                        child: Text(
                          data.desc,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
