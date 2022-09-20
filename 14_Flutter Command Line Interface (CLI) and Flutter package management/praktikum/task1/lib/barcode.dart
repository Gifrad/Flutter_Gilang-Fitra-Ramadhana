import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class BarcodeScreen extends StatelessWidget {
  const BarcodeScreen({Key? key}) : super(key: key);
  final textOne = 'Alterra Academy';
  final textTwo = 'Flutter asik';
  final textThree = 'Gilang Fitra Ramadhana';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const Home()),
                (Route<dynamic> route) => false);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text('BARCODE'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 35)),
            Center(
              child: BarcodeWidget(
                barcode: Barcode.qrCode(errorCorrectLevel: BarcodeQRCorrectionLevel.low),
                data: textOne,
                width: 100,
                height: 100,
                margin:const EdgeInsets.only(bottom: 12),
              ),
            ),
            Text(
              textOne,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            const Divider(height: 50, thickness: 6),
            Center(
              child: BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: textTwo,
                width: 100,
                height: 100,
                margin:const EdgeInsets.only(bottom: 12),
              ),
            ),
            Text(
              textTwo,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            const Divider(height: 50, thickness: 6),
            Center(
              child: BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: textThree,
                width: 100,
                height: 100,
                margin:const EdgeInsets.only(bottom: 12),
              ),
            ),
            Text(
              textThree,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
