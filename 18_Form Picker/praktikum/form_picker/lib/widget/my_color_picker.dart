import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MyColorPicker extends StatefulWidget {
  const MyColorPicker(BuildContext context, {super.key});

  @override
  State<MyColorPicker> createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  // Color _currentColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return colorPicker();
  }

  Widget colorPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 0.3,
          color: Colors.black,
        ),
        const Text(
          'Color Theme',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        // TextFormField(
        //   readOnly: true,
        //   decoration: InputDecoration(
        //     fillColor: _currentColor,
        //     filled: true,
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     hintText: 'Pick Color',
        //   ),
        //   onTap: () {
        //     showDialog(
        //       context: context,
        //       builder: (context) {
        //         return AlertDialog(
        //           title: const Text('Pick Your Color'),
        //           content: ColorPicker(
        //             pickerColor: _currentColor,
        //             onColorChanged: (color) {
        //               setState(() {
        //                 _currentColor = color;
        //               });
        //             },
        //           ),
        //           actions: [
        //             TextButton(
        //               onPressed: (){
        //                 Navigator.pop(context);
        //               },
        //               child: const Text('Done'),
        //             )
        //           ],
        //         );
        //       },
        //     );
        //   },
        // ),
      ],
    );
  }
}
