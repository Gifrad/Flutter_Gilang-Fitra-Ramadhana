import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mvvm/viewmodel/user_viewmodel.dart';

import 'list_user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<UserViewModel>(
            builder: (context, value, child) => Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _jobController,
                  decoration: const InputDecoration(
                    labelText: 'job',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        value.get();
                      },
                      child: const Text('GET'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        value.post(_nameController.text, _jobController.text);
                      },
                      child: const Text('POST'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        value.put(_nameController.text, _jobController.text);
                      },
                      child: const Text('PUT'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        value.delete();
                      },
                      child: const Text('DELETE'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 3),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Result",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Text(
                          value.responseData,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if (userViewModel.items.isNotEmpty) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ListUserPage(),
              ),
            );
          } else {
            return;
          }
        },
      ),
    );
  }
}
