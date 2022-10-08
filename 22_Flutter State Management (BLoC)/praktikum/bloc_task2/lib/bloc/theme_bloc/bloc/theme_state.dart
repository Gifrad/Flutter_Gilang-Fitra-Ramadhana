import 'package:equatable/equatable.dart';

abstract class ThemeState extends Equatable {
  final bool isDark;
  const ThemeState(this.isDark);
  @override
  List<Object> get props => [isDark];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial(super.isDark);
}





