import 'package:flutter/material.dart';
import 'package:weatherapp/services/theme_persistance.dart';
import 'package:weatherapp/utils/thems.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeDataModes().lightTheme;
  final ThemePersistence _themePersistence = ThemePersistence();

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData get getThemeData => _themeData;

  set setThemeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  Future<void> toggleTheme(bool isDark) async {
    setThemeData =
        isDark ? ThemeDataModes().darkTheme : ThemeDataModes().lightTheme;
    await _themePersistence.storeTheme(isDark);
  }

  Future<void> _loadTheme() async {
    bool isDark = await _themePersistence.loadTheme();
    setThemeData =
        isDark ? ThemeDataModes().darkTheme : ThemeDataModes().lightTheme;
  }
}
