import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_provider/provider/user_data.dart';
import 'package:task_provider/screens/register_screen.dart';

import '../provider/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial() async {
    final getUser = Provider.of<UserDataProvider>(context, listen: false);
    getUser.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Consumer<ThemeProvider>(
              builder: (context, notifier, child) => InkWell(
                onTap: () {
                  notifier.changeTheme();
                },
                child: const Icon(Icons.brightness_medium_outlined),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserDataProvider>(
              builder: (context, value, child) => Text(
                "${value.user?.email}",
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Consumer<UserDataProvider>(
              builder: (context, value, child) => Text(
                '${value.user?.name}',
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Consumer<UserDataProvider>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: () async {
                  await value.deleteUSer();
                  if(mounted){}
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                      (route) => false);
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
