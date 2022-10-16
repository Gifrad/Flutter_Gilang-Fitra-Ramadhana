import 'package:flutter/cupertino.dart';
import 'package:task_mvvm/models/user_model.dart';
import 'package:task_mvvm/services/user_api.dart';

class UserViewModel extends ChangeNotifier{
  late UserApi _service;
  List<UserModel> _items = [];
  String _responseData = '';

  UserViewModel(){
    _service = UserApi();
  }

  List<UserModel> get items => _items;
  String get responseData => _responseData;

  void get()async{
    final result = await _service.get();
    _responseData = result;
    _items = await _service.getUserData();
    notifyListeners();
  }

  void post(String name , String job) async{
    final result = await _service.post(name, job);
    _responseData = result;
    notifyListeners();
  }

  void put(String name, String job) async{
    final result = await _service.put(name, job);
    _responseData = result;
    notifyListeners();
  }

  void delete() async {
    final result = await _service.delete();
    _responseData = result;
    notifyListeners();
  }
}