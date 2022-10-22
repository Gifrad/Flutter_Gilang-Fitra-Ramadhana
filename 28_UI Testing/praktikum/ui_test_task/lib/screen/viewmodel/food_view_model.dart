import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/food_model.dart';
import '../../service/food_api.dart';

enum FoodViewState {
  none,
  loading,
  error,
}

final List images = [
  'https://cdn0-production-images-kly.akamaized.net/aDZbOOV2WeJCgCiBFgFQwoXJN64=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2029093/original/066661300_1521949447-Bakso.jpg',
  'https://www.nibble.id/uploads/asal_usul_mie_ayam_01_0ace759bee.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/e/eb/NasiKucing.jpg',
];

class FoodViewModel extends ChangeNotifier {
  FoodViewState _state = FoodViewState.none;
  FoodViewState get state => _state;

  List<FoodModel> _foodMenu = [];
  List<FoodModel> get foodMenu => _foodMenu;

  void changeState(FoodViewState state) {
    _state = state;
  }

  Future<void> getAllMenu() async {
    FoodApi foodApi = FoodApi();
    changeState(FoodViewState.loading);
    try {
      final resultMenu = await foodApi.getAllFood();
      _foodMenu = resultMenu;
      changeState(FoodViewState.none);
      notifyListeners();
    } catch (e) {
      changeState(FoodViewState.error);
      notifyListeners();
    }
  }
}

Future<List<FoodModel>> getFood() async {
  final foods = await FoodApi().getAllFood();
  return foods;
}

final foodViewModel = FutureProvider<List<FoodModel>>(
  (ref) async {
    final foods = await FoodApi().getAllFood();
    return foods;
  },
);
