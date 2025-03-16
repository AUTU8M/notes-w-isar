import 'package:flutter/material.dart';
import 'package:notesapp_isar/theme/theme.dart';

class ThemedataProvider with ChangeNotifier {
  //initially, theme is light mode
  ThemeData _themeData = lightMode;

  //getter method to acess the theme from other parts of code
  ThemeData get themeData => _themeData;

  //getter method to see if we are in dart mode or not
  bool get isDarkMode => _themeData == darkMode;

  //setter method to set the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //we will use this toggle in a switch later on..
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
