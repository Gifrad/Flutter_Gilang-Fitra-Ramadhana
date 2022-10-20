import 'package:test/test.dart';
import 'package:unit_test_task/model/food_model.dart';
import 'package:unit_test_task/service/food_api.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'food_api_test.mocks.dart';

@GenerateMocks([FoodApi])
void main() {
  group('FoodApi', () {
    FoodApi foodApi = MockFoodApi();
    test(
      'get all menu food return data',
      () async {
        when(foodApi.getAllFood()).thenAnswer(
          (realInvocation) async => <FoodModel>[
            FoodModel(id: 1, name: 'ramen'),
          ],
        );
        var foods = await foodApi.getAllFood();
        expect(foods.isNotEmpty, true);
      },
    );
  });
}
