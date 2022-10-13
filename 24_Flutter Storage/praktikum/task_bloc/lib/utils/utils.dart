import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class Utils {
  Future<dynamic> setPrefUser(UserModel user) async {
    final pref = await SharedPreferences.getInstance();
    final name = await pref.setString('name', user.name);
    final email = await pref.setString('email', user.email);
    final number = await pref.setString('number', user.number);
    final pass = await pref.setString('pass', user.pass);

    if (name && email && number && pass) return true;
    return false;
  }

  Future<dynamic> getPrefUser() async {
    return Future(() async {
      final pref = await SharedPreferences.getInstance();
      final name = pref.getString('name');
      final email = pref.getString('email');
      final number = pref.getString('number');
      final pass = pref.getString('pass');

      if (name != null && email != null && number != null && pass != null) {
        return UserModel(name: name, email: email, number: number, pass: pass);
      }
      return null;
    });
  }

  Future<dynamic> deletePrefUser() async {
    final pref = await SharedPreferences.getInstance();
    final name = await pref.remove('name');
    final email = await pref.remove('email');
    final number = await pref.remove('number');
    final pass = await pref.remove('pass');

    if(name && email && number && pass){
      return true;
    }
    return false;
  }

  Future<dynamic> isLogin() async{
    var currentUser = await getPrefUser();
    if(currentUser != null ){
      return true;
    }
    return false;
  }
 }
