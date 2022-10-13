import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  final String key = 'theme';
  late bool _isDark;
  late SharedPreferences _prefs;

  bool get isDark => _isDark;

  ThemeProvider() {
    _isDark = true;
    _loadFromPref();
  }

  void changeTheme() {
    _isDark = !_isDark;
    _saveToPref();
    notifyListeners();
  }

  Future<void> _initPref() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _loadFromPref() async {
    await _initPref();
    _isDark = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  Future<void> _saveToPref() async {
    await _initPref();
    _prefs.setBool(key, _isDark);
  }
}
