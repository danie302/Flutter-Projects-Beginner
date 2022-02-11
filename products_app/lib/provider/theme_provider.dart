import 'package:flutter/material.dart';

import 'package:products_app/themes/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  setLightMode() {
    isDarkMode = false;
    notifyListeners();
  }

  setDarkMode() {
    isDarkMode = true;
    notifyListeners();
  }

  ThemeData currenteTheme() {
    return isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
  }
}
