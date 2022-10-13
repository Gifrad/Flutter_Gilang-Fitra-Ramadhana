part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => List.empty();
}

class UserInitial extends UserState {}

class UserLogin extends UserState {
  final UserModel? user;
  final bool? isLogin;
  final bool? statusAction;
  UserLogin({this.user,this.statusAction, this.isLogin});

  @override
  List<Object?> get props => [user, statusAction, isLogin];
}

