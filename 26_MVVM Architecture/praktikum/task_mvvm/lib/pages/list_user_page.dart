import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mvvm/viewmodel/user_viewmodel.dart';

class ListUserPage extends StatelessWidget {
  const ListUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
      ),
      body: Card(
          elevation: 4,
          child: ListView.separated(
            itemCount: userViewModel.items.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(userViewModel.items[index].avatar),
                    ),
                    title: Text(
                      '${userViewModel.items[index].firstName}'
                      ' '
                      '${userViewModel.items[index].lastName}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        userViewModel.items[index].avatar),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('ID        : '),
                                          SizedBox(height: 10,),
                                          Text('NAME : '),
                                          SizedBox(height: 10,),
                                          Text('EMAIL : ')
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            userViewModel.items[index].id
                                                .toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 10,),

                                          Text(
                                              '${userViewModel.items[index].firstName} ${userViewModel.items[index].lastName}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 10,),

                                          Text(userViewModel.items[index].email,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('Detail'),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.black),
          )),
    );
  }
}
