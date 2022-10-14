import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly3/pages/home/viewmodel/home_view_model.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) => ListView.separated(
        itemCount: value.userData.length,
        itemBuilder: (context, index) {
          return Container(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.deepPurpleAccent.shade700,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 4,
                  child: ClipPath(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              color: Colors.deepPurpleAccent.shade700,
                              width: 5),
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          size: 40,
                          color: Colors.deepPurpleAccent.shade700,
                        ),
                        title: Text('Name : ${value.userData[index].firstName}'
                            ''
                            '${value.userData[index].lastName}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('email :${value.userData[index].email}'),
                            Text('message :${value.userData[index].message}')
                          ],
                        ),
                        trailing: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title:
                                      const Text('Anda yakin ingin menghapus?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Tidak"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        value.deleteUser(index);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Ya'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.redAccent.shade200,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(),
      ),
    );
  }
}
