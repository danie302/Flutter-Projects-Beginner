import 'package:flutter/material.dart';

import 'package:products_app/preferences.dart';
import 'package:products_app/themes/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  ThemeProvider() {
    _isDarkMode = Preferences.darkMode;
  }

  setLightMode() {
    _isDarkMode = false;
    Preferences.darkMode = false;
    notifyListeners();
  }

  setDarkMode() {
    _isDarkMode = true;
    Preferences.darkMode = true;
    notifyListeners();
  }

  ThemeData currentTheme() {
    return _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
  }
}
