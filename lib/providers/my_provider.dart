import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;


  changeTheme(ThemeMode themeMode) async{
    appTheme = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save an boolean value to 'repeat' key.
    await prefs.setBool('isLight', appTheme == ThemeMode.light);
    notifyListeners();
  }

  // getTheme() async{
  //
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // Try reading data from the 'repeat' key. If it doesn't exist, returns null.
  //   final bool? isLLight = prefs.getBool('isLight');
  //   if(isLLight!=null){
  //     if(isLLight){
  //       appTheme = ThemeMode.light;
  //     }else{
  //       appTheme = ThemeMode.dark;
  //     }
  //   }
  //   notifyListeners();
  // }
}