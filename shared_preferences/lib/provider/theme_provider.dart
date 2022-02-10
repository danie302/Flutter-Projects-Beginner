import 'package:flutter/material.dart';
import 'package:user_preferences/shared_preferences/preferences.dart';
import 'package:user_preferences/themes/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  ThemeProvider() {
    isDarkMode = Preferences.darkMode;
  }

  setLightMode() {
    isDarkMode = false;
    Preferences.darkMode = false;
    notifyListeners();
  }

  setDarkMode() {
    isDarkMode = true;
    Preferences.darkMode = true;
    notifyListeners();
  }

  ThemeData currenteTheme() {
    return isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
  }
}
