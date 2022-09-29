import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MyFilePicker extends StatefulWidget {
 const MyFilePicker(BuildContext context, {super.key});

  @override
  State<MyFilePicker> createState() => _MyFilePickerState();
}

class _MyFilePickerState extends State<MyFilePicker> {
  // void _pickFile() async {
  //   final resultFile = await FilePicker.platform.pickFiles();
  //   if (resultFile == null) return;
  //   final PlatformFile file = resultFile.files.first;
  //   setState(() {
  //     imagepath = File(file.path.toString());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return filePicker();
  }

  //  File? imagepath;

  Widget filePicker() {
    const textTitle = 'Cover';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          textTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // showFilePicker(),
        // const SizedBox(
        //   height: 20,
        // ),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
        //        borderRadius: BorderRadius.circular(10.0),
        //        ),),
        //   onPressed: _pickFile,
        //   child: const Text('Pilih File'),
        // ),
      ],
    );
  }

  // Widget showFilePicker() => imagepath != null
  //     ? Container(
  //       height: 200,
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //         border: Border.all(),
  //         borderRadius: BorderRadius.circular(16),
  //       ),
  //       child: SizedBox(
  //         child: Image.file(
  //           imagepath!,
  //           fit: BoxFit.none,
  //         ),
  //       ),
  //     )
  //     : Container(
  //       height: 120,
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //         border: Border.all(),
  //         borderRadius: BorderRadius.circular(16)
  //       ),
  //       child: const Icon(Icons.photo,size: 90,),
  //     );
}
