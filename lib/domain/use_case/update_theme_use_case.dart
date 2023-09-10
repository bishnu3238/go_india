import 'package:flutter/material.dart';

 import '../store/store.dart';

class UpdateThemeUseCase{
  final  ThemeStore _themeStore;
  UpdateThemeUseCase(this._themeStore);


  void execute(ThemeMode themeType)=> _themeStore.setTheme(themeType);



}