import 'package:flutter/foundation.dart';
import 'package:weekly3/models/user_model.dart';

class HomeViewModel extends ChangeNotifier{
  final List<UserModel> _userData = [];

  List<UserModel> get userData => _userData;

  void addUser(UserModel user){
    _userData.add(user);
    notifyListeners();
  }

  void deleteUser(int index){
    _userData.removeAt(index);
    notifyListeners();
  }

}