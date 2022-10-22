import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_task/model/food_model.dart';
import 'package:unit_test_task/screen/food_screen.dart';
import 'package:unit_test_task/screen/viewmodel/food_view_model.dart';

void main() {
  testWidgets('food screen AppBar', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          foodViewModel.overrideWithProvider(FutureProvider(
            (ref) async{
              return [
                FoodWithImage(
                  imageUrl: 'test.png',
                  id: 1,
                  name: "Buah",
                ),
              ];
            },
          )),
        ],
        child: const MaterialApp(
          home: FoodScreen(),
        ),
      ),
    );
     expect(find.text('Menu'), findsOneWidget);
  });

  testWidgets('food screen Loading', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          foodViewModel.overrideWithProvider(FutureProvider(
            (ref) async{
              return [
                FoodWithImage(
                  imageUrl: 'test.png',
                  id: 1,
                  name: "Buah",
                ),
              ];
            },
          )),
        ],
        child: const MaterialApp(
          home: FoodScreen(),
        ),
      ),
    );
     expect(find.byType(CircularProgressIndicator), findsWidgets);
  });

  testWidgets('food screen Center Widget', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          foodViewModel.overrideWithProvider(FutureProvider(
            (ref) async{
              return [
                FoodWithImage(
                  imageUrl: 'test.png',
                  id: 1,
                  name: "Buah",
                ),
              ];
            },
          )),
        ],
        child: const MaterialApp(
          home: FoodScreen(),
        ),
      ),
    );
     expect(find.byType(Center), findsWidgets);
  });

  testWidgets('food screen Text Widget', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          foodViewModel.overrideWithProvider(FutureProvider(
            (ref) async{
              return [
                FoodWithImage(
                  imageUrl: 'test.png',
                  id: 1,
                  name: "Buah",
                ),
              ];
            },
          )),
        ],
        child: const MaterialApp(
          home: FoodScreen(),
        ),
      ),
    );
     expect(find.byType(Text), findsWidgets);
  });

}
