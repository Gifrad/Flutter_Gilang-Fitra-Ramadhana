import 'package:flutter/material.dart';
import 'package:task_rest_api/model/user_model.dart';

class NextTask extends StatelessWidget {
  final List<UserModel> user;
  const NextTask({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: user.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.network(
                      user[index].avatar,
                    ),
                  ),
                  title: Text('${user[index].firstName} ${user[index].lastName}'),
                  subtitle: Text(user[index].email),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
