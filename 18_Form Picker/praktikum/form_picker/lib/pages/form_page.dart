import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:form_picker/pages/result_page.dart';
import 'package:form_picker/widget/my_color_picker.dart';
import 'package:form_picker/widget/my_date_picker.dart';
import 'package:form_picker/widget/my_description.dart';
import 'package:form_picker/widget/my_file_picker.dart';
import 'package:intl/intl.dart';

class FromPage extends StatefulWidget {
  const FromPage({super.key});

  @override
  State<FromPage> createState() => _FromPageState();
}

class _FromPageState extends State<FromPage> {
  final textController = TextEditingController();
  File? imagepath;
  final currentDate = DateTime.now();
  DateTime _dueDate = DateTime.now();
  TextEditingController desc = TextEditingController();

  void _pickFile() async {
    final resultFile = await FilePicker.platform.pickFiles();
    if (resultFile == null) return;
    final PlatformFile file = resultFile.files.first;
    setState(() {
      imagepath = File(file.path.toString());
    });
  }

  Color _currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Form Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MyFilePicker(context),
              showFilePicker(),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: _pickFile,
                child: const Text('Pilih File'),
              ),
              MyDatePicker(context),
              TextFormField(
                readOnly: true,
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'dd-mm-yyyy',
                ),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(1945),
                    lastDate: DateTime.now(),
                  );
                  setState(() {
                    if (selectedDate != null) {
                      _dueDate = selectedDate;
                      textController.text =
                          DateFormat('dd-mm-yyyy').format(_dueDate);
                    }
                  });
                },
              ),
              MyColorPicker(context),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: _currentColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Pick Color',
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Pick Your Color'),
                        content: ColorPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                            });
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Done'),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
              MyDescription(context),
              TextFormField(
                controller: desc,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                margin:  const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            gambar: imagepath!.path,
                            date: textController.text,
                            warna: _currentColor,
                            text: desc.text,
                          ),
                        ),
                      );
                    },
                    child: const Text('Simpan')),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showFilePicker() => imagepath != null
      ? Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            child: Image.file(
              imagepath!,
              fit: BoxFit.none,
            ),
          ),
        )
      : Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(16)),
          child: const Icon(
            Icons.photo,
            size: 90,
          ),
        );
}
