import 'package:bloc_task2/bloc/theme_bloc/bloc/theme_bloc.dart';
import 'package:bloc_task2/screens/home_page.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/contact_bloc.dart';
import 'bloc/theme_bloc/bloc/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContactBloc>(
          create: (context) => ContactBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final ThemeData dark = ThemeData.dark();
          final ThemeData light = ThemeData.light();
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state.isDark? dark : light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
