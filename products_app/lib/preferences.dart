import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _darkMode = false;

  static bool get darkMode {
    return _prefs.getBool('darkMode') ?? _darkMode;
  }

  static set darkMode(bool darkMode) {
    _darkMode = darkMode;
    _prefs.setBool('darkMode', darkMode);
  }

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
