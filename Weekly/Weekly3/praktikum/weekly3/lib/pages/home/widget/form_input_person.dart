import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly3/models/user_model.dart';
import 'package:weekly3/pages/home/viewmodel/home_view_model.dart';

class FormInputPersonal extends StatefulWidget {
  const FormInputPersonal({super.key});

  @override
  State<FormInputPersonal> createState() => _FormInputPersonalState();
}

class _FormInputPersonalState extends State<FormInputPersonal> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //check render
    // print('rebuild');
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameController,
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    label: const Text('Nama Depan'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  controller: _lastNameController,
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    label: const Text('Nama Belakang'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _emailController,
            style: const TextStyle(fontSize: 12),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: const Text('Email'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.all(8),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Apakah Anda butuh bantuan?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _messageController,
            style: const TextStyle(fontSize: 12),
            maxLines: 5,
            decoration: InputDecoration(
                label: const Text('Ketik Disini'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.all(8)),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 120),
            child: FloatingActionButton.extended(
              label: const Text('Send'),
              icon: const Icon(Icons.send),
              backgroundColor: Colors.deepPurpleAccent[700],
              onPressed: () {
                _showAlertDialog();
              },
            ),
          )
        ],
      ),
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nama Lengkap",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('${_firstNameController.text} '
                    '${_lastNameController.text}'),
                const Divider(
                  thickness: 1,
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(_emailController.text),
                const Divider(
                  thickness: 1,
                ),
                const Text(
                  'Bantuan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(_messageController.text),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.deepPurpleAccent[700],
                        ),
                        child: const Text('Ubah'),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Consumer<HomeViewModel>(
                        builder: (context, value, child) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Colors.deepOrangeAccent,
                          ),
                          onPressed: () {
                            final firstName = _firstNameController.text;
                            final lastName = _lastNameController.text;
                            final email = _emailController.text;
                            final message = _messageController.text;

                            final newUser = UserModel(
                              firstName: firstName,
                              lastName: lastName,
                              email: email,
                              message: message,
                            );
                            if (firstName.isNotEmpty &&
                                lastName.isNotEmpty &&
                                email.isNotEmpty &&
                                message.isNotEmpty) {
                              value.addUser(newUser);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Data Telah Di Tambahkan'),
                                ),
                              );
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Gagal, Data Tidak di masukan'),
                                ),
                              );
                              Navigator.pop(context);
                            }

                            _firstNameController.clear();
                            _lastNameController.clear();
                            _emailController.clear();
                            _messageController.clear();

                            //check list
                            print('homeviewmodel : ${value.userData.length}');
                            
                          },
                          child: const Text("Kirim"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}
