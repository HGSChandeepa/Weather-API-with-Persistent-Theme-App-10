import 'package:shared_preferences/shared_preferences.dart';

class ThemePersistence {
  // Store the user's saved theme in shared preferences
  Future<void> storeTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
    print('Theme stored');
  }

  // Load the user's saved theme from shared preferences
  Future<bool> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Theme loaded');

    return prefs.getBool('isDark') ?? false; // Default to light theme
  }
}
