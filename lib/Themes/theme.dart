
import 'package:petmatch/settings.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  late ThemeData _selectedTheme;

  ThemeData light = ThemeData.light(useMaterial3: false).copyWith(

  );

  ThemeData dark = ThemeData.dark(useMaterial3: false).copyWith(
    primaryColor: Colors.white,
  );

  ThemeProvider({required bool isDarkMode}){
    this._selectedTheme = isDarkMode ? dark : light;

  }

  void swapTheme() {
    _selectedTheme = _selectedTheme == dark ? light : dark;
    notifyListeners();
    if(_selectedTheme == dark){
      themeSwitchState = true;
    }else{
      themeSwitchState = false;
    }
  }

  ThemeData get getTheme => _selectedTheme;
}