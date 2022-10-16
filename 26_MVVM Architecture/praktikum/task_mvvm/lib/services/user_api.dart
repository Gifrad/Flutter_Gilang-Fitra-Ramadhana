import 'package:dio/dio.dart';
import 'package:task_mvvm/models/user_model.dart';

class UserApi {
  late Dio _dio;
  static const baseUrl = 'https://reqres.in/api/users';

  UserApi() {
    _dio = Dio();
  }

  Future<String> get() async {
    final Response response = await _dio.get(baseUrl);
    if (response.data['data'] != null) {
      return response.data['data'].toString();
    }
    return '';
  }

  Future<List<UserModel>> getUserData() async {
    final Response response = await _dio.get(baseUrl);
    if (response.data['data'] != null) {
      return List<UserModel>.from(
        response.data['data'].map((data) {
          return UserModel.fromJson(data);
        }).toList(),
      );
    }
    return [];
  }

  Future<String> post(String name, String job) async {
    Map<String, dynamic> map = {
      'name': name,
      'job': job,
    };

    final Response response = await _dio.post(baseUrl, data: map);
    if(response.data != null){
      return response.data.toString();
    }
    return '';
  }

  Future<String> put(String name, String job) async {
    Map<String, dynamic> map = {
      'name': name,
      'job': job,
    };

    final Response response = await _dio.put('$baseUrl/4', data: map);
    if(response.data != null){
      return response.data.toString();
    }
    return '';
  }

  Future<String> delete() async{
    final Response response = await _dio.delete('$baseUrl/4');
    return response.data.toString();
  }
  
}
