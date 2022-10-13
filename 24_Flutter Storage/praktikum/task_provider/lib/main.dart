import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_provider/provider/theme.dart';
import 'package:task_provider/provider/user_data.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ThemeData.dark();
    final light = ThemeData.light();
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => MaterialApp(
        title: 'Section 24',
        theme: value.isDark? light : dark,
        debugShowCheckedModeBanner: false,
        home: const RegisterScreen(),
      ),
    );
  }
}
