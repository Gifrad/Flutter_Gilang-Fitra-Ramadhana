import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bloc/models/user_model.dart';
import 'package:task_bloc/utils/utils.dart';

part 'user_state.dart';

class UserBloc extends Cubit<UserState> {
  late Utils _utils;
  UserBloc() : super(UserInitial()) {
    _utils = Utils();
  }

  void getUser() async {
    var user = await _utils.getPrefUser();
    var isLogin = await _utils.isLogin();
    emit(UserLogin(user: user, isLogin: isLogin));
  }

  dynamic setUser(UserModel user)async{
    var result = await _utils.setPrefUser(user);
    getUser();
    return result;
  }

  dynamic deleteUser()async{
    var result = await _utils.deletePrefUser();
    getUser();
    return result;
  }
}
