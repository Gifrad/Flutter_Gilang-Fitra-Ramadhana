import 'package:dio/dio.dart';
import 'package:unit_test_task/model/food_model.dart';

class FoodApi {
  final Dio _dio = Dio();

  Future<List<FoodModel>> getAllFood() async {
    try {
      final Response response = await _dio.get(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods');

      List<FoodModel> food = (response.data as List)
          .map(
            (e) => FoodModel(
              id: e['id'],
              name: e['name'],
            ),
          )
          .toList();

      return food;
    } on DioError {
      rethrow;
    }
  }
}
