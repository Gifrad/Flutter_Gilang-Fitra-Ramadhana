import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bloc/bloc/user_bloc.dart';
import 'package:task_bloc/screens/home_screen.dart';

import '../models/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberPhoneController = TextEditingController();
  final _passwordController = TextEditingController();

  
  @override
  void initState() {
    super.initState();
    _initial();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _numberPhoneController.dispose();
    super.dispose();
  }

  void _initial() {
    context.read<UserBloc>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.account_circle_rounded),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && value.length < 4) {
                    return 'Enter at leats 4 Character';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_rounded),
                  border: OutlineInputBorder(),
                ),
                validator: (email) {
                  if (email != null && !EmailValidator.validate(email)) {
                    return 'Enter a valid Email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _numberPhoneController,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: 'Number Phone',
                  prefixIcon: Icon(Icons.call),
                  border: OutlineInputBorder(),
                ),
                validator: (number) {
                  if (number != null) {
                    if (number.length < 10) {
                      return 'Must be 10 number';
                    }
                  } else {
                    return null;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password_rounded),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && value.length < 5) {
                    return 'Enter min. 5 Character';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocListener<UserBloc, UserState>(
                    listener: (context, state) {
                      if (state is UserLogin) {
                       var isLogin = state.isLogin ?? false;
                        if (isLogin) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                              (route) => false);
                        }
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () async {
                        final name = _nameController.text;
                        final email = _emailController.text;
                        final number = _numberPhoneController.text;
                        final pass = _passwordController.text;
                        final UserModel newUser = UserModel(
                            name: name,
                            email: email,
                            number: number,
                            pass: pass);

                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          await context.read<UserBloc>().setUser(newUser);
                          if (mounted) {}
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                              (route) => false);
                        }
                      },

                      child: const Text('Login'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState!.reset();
                    },
                    child: const Text('Reset'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
