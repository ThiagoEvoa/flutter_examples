import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkThemeSelected;

  final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );

  ThemeProvider(this._isDarkThemeSelected);

  ThemeData get getTheme => _isDarkThemeSelected ? darkTheme : lightTheme;

  setTheme(bool isDarkThemeSelected) {
    this._isDarkThemeSelected = isDarkThemeSelected;
    notifyListeners();
  }
}
