import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task_rest_api/model/user_model.dart';

import 'next_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  final Dio _dio = Dio();
  static const baseUrl = 'https://reqres.in/api/users';
  List<UserModel> _users = [];
  String responseData = '';

  @override
  void dispose() {
    _nameController.dispose();
    _jobController.dispose();
    super.dispose();
  }

  Future<List<UserModel>> getAllModels() async {
    final response = await _dio.get(baseUrl);
    if (response.data['data'] != null) {
      return List<UserModel>.from(response.data['data']
          .map((data) => UserModel.fromJson(data))
          .toList());
    }
    return [];
  }

  Future<void> _fetchData() async {
    _users = await getAllModels();
    setState(() {
      _users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TASK 1'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
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
                      _get();
                    },
                    child: const Text('GET'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _post();
                    },
                    child: const Text('POST'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _put();
                    },
                    child: const Text('PUT'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _delete();
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
                        responseData,
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if (_users.isNotEmpty) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NextTask(user: _users),
              ),
            );
          } else {
            return;
          }
        },
      ),
    );
  }

  Future<void> _get()async{
    final Response response = await _dio.get(baseUrl);
    setState(() {
      responseData = response.data.toString();
    });
    _fetchData();
  }


  Future<void> _post()async{
    Map<String, dynamic> map = {
      "name" : _nameController.text,
      "job" : _jobController.text,
    };
    final Response response = await _dio.post(baseUrl, data: map);
    setState(() {
      responseData = response.toString();
    });
  }

  Future<void> _put()async{
    Map<String, dynamic> map ={
      "name" : _nameController.text,
      "job" : _jobController.text,
    };
    final Response response = await _dio.put('$baseUrl/4', data: map);
    setState(() {
      responseData = response.toString();
    });
  }


  Future<void> _delete()async{
    final Response response = await _dio.delete('$baseUrl/4');
    setState(() {
      responseData = response.data.toString();
    });
  }
}
