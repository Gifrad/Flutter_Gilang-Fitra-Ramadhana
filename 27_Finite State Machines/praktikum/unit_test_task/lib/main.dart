import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_test_task/screen/viewmodel/food_view_model.dart';

import 'screen/food_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FoodViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FoodScreen(),
      ),
    );
  }
}

