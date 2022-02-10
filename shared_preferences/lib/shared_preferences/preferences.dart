import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static int _gender = 1;
  static String _name = "";
  static bool _darkMode = false;

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt('gender', gender);
  }

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
