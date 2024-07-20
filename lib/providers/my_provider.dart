//import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  changeTheme(ThemeMode themeMode) {
    appTheme = themeMode;

    notifyListeners();
  }
}