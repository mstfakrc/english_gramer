import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static bool areAllPagesViewed = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get allPagesViewed {
    return _prefs.getBool('allPagesViewed') ?? false;
  }

  static set allPagesViewed(bool value) {
    _prefs.setBool('allPagesViewed', value);
  }
}
