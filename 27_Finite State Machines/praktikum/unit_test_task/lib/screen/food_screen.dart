import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_test_task/screen/viewmodel/food_view_model.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  Future<void> _initial() async {
    await context.read<FoodViewModel>().getAllMenu();
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FoodViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
      ),
      body: body(viewModel),
    );
  }

  Widget body(FoodViewModel viewModel) {
    final isLoading = viewModel.state == FoodViewState.loading;
    final isError = viewModel.state == FoodViewState.error;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (isError) {
      return const Center(child: Text('data tidak di temukan'));
    }

    return listView(viewModel);
  }

  Widget listView(FoodViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.foodMenu.length,
      itemBuilder: (context, index) {
        final foods = viewModel.foodMenu[index];
        return Card(
          child: ListTile(
            leading: Consumer<FoodViewModel>(
              builder: (context, value, child) => CircleAvatar(
                backgroundImage: NetworkImage(
                  value.image[index],
                ),
              ),
            ),
            title: Text(foods.id.toString()),
            subtitle: Text(foods.name),
          ),
        );
      },
    );
  }
}
