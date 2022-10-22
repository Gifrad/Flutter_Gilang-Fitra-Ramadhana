import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_task/model/food_model.dart';
import 'viewmodel/food_view_model.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final viewModel = ref.watch(foodViewModel);
          return viewModel.when(
            error: (error, stackTrace) =>
                const Center(child: Text('data tidak di temukan')),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final food = data[index];
                  final image = images[index];
                  final newFood = FoodWithImage(id: food.id, name: food.name, imageUrl: image);
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(newFood.imageUrl),
                      ),
                      title: Text(newFood.id.toString()),
                      subtitle: Text(newFood.name),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

  // Widget body(FoodViewModel viewModel) {
  //   final isLoading = viewModel.state == FoodViewState.loading;
  //   final isError = viewModel.state == FoodViewState.error;

  //   if (isLoading) {
  //     return const Center(child: CircularProgressIndicator());
  //   }
  //   if (isError) {
  //     return const Center(child: Text('data tidak di temukan'));
  //   }

  //   return listView(viewModel);
  // }

  // Widget listView(FoodViewModel viewModel) {
  //   return ListView.builder(
  //     itemCount: viewModel.foodMenu.length,
  //     itemBuilder: (context, index) {
  //       final foods = viewModel.foodMenu[index];
  //       return Card(
  //         child: ListTile(
  //           leading: CircleAvatar(
  //             backgroundImage: NetworkImage(''),
  //           ),
  //           title: Text(foods.id.toString()),
  //           subtitle: Text(foods.name),
  //         ),
  //       );
  //     },
  //   );
  // }

