import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme(bool islightModel) {
    _themeMode = islightModel ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
