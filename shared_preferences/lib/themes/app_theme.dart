import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.blueAccent;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primary,
    ),
    iconTheme: const IconThemeData(
      color: primary,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: primary,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primary,
    ),
    iconTheme: const IconThemeData(
      color: primary,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: primary,
    ),
  );
}
