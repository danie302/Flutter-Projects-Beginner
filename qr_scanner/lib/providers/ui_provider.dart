import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOption = 0;

  int get getSelectedMenuOption => _selectedMenuOption;

  setSelectedMenuOption(int value) {
    _selectedMenuOption = value;
    notifyListeners();
  }
}
