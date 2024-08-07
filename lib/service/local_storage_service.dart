import 'package:shared_preferences/shared_preferences.dart';

import '../util/common.dart';

class LocalStorageServices {
  static const String language = "sPLanguage";
  static late SharedPreferences _sharedPreferences;

  // Initialize the shared preferences instance
  static Future<void> initLocalStorage() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
    } catch (e) {
      superPrint(e);
    }
  }

  // Get the language from shared preferences
  static String? getLanguage() {
    try {
      return _sharedPreferences.getString(language);
    } catch (e) {
      superPrint(e);
      return null;
    }
  }

  // Set  language in shared preferences
  static Future<void> setToken(String languageCode) async {
    try {
      await _sharedPreferences.setString(language, languageCode);
    } catch (e) {
      superPrint(e);
    }
  }
}
