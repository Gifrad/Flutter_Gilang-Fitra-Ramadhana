import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bloc/bloc/user_bloc.dart';
import 'package:task_bloc/screens/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLogin) {
                  return Text(state.user?.name ?? '');
                }
                return const SizedBox();
              },
            ),
            const SizedBox(
              height: 6,
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLogin) {
                  return Text(state.user?.email ?? '');
                }
                return const SizedBox();
              },
            ),
            const SizedBox(
              height: 6,
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) => ElevatedButton(
                onPressed: () async {
                  await context.read<UserBloc>().deleteUser();
                  if (mounted) {}
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
