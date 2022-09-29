import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker(BuildContext context, {super.key});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  // final textController = TextEditingController();
  // final currentDate = DateTime.now();
  // DateTime _dueDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return datePicker();
  }

  Widget datePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 0.3,
          color: Colors.black,
        ),
        const Text(
          'Publish At',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        // TextFormField(
        //   readOnly: true,
        //   controller: textController,
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     hintText: 'dd-mm-yyyy',
        //   ),
        //   onTap: () async {
        //     final selectedDate = await showDatePicker(
        //       context: context,
        //       initialDate: currentDate,
        //       firstDate: DateTime(1945),
        //       lastDate: DateTime.now(),
        //     );
        //     setState(() {
        //       if(selectedDate != null){
        //         _dueDate = selectedDate;
        //         textController.text = DateFormat('dd-mm-yyyy').format(_dueDate);
        //       }
        //     });
        //   },
        // ),
      ],
    );
  }
}
