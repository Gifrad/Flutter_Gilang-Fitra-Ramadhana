
import 'package:flutter/foundation.dart';
import 'package:task_provider/models/user_model.dart';
import 'package:task_provider/utils/utils.dart';

class UserDataProvider extends ChangeNotifier {
  bool _isLogin = false;
  UserModel? _user;
  late Utils _utils;

  UserDataProvider(){
    _utils = Utils();
  }

  dynamic get isLogin async {
    _isLogin =  await _utils.isLogin();
    return _isLogin;
  }

  UserModel? get user{
    return _user;
  }

  dynamic setUser(UserModel user) async {
    final saveUSer = await _utils.setPrefUser(user);
    return saveUSer;
  }

  void getUser() async {
    _user = await _utils.getPrefUser();
    notifyListeners();
  }

  dynamic deleteUSer()async{
    return await _utils.deletePrefUser();
  }
}
