import '/bloc/theme_bloc/bloc/theme_event.dart';
import '/bloc/theme_bloc/bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial(false)) {
    on<ThemeChange>((event, emit) {
      emit(ThemeInitial(!state.isDark));
    });
  }
}
