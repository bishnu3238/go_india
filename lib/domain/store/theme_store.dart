 import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../package/package/package.dart';
 import '../../utility/utility/utility.dart';

class ThemeStore extends HydratedCubit<ThemeState> {
  ThemeStore() : super(ThemeState.init());

  void setTheme(ThemeMode themeMode) =>
      emit(state.copyWith(themeMode: themeMode));

  @override
  ThemeState? fromJson(Map<String, dynamic> json) =>
      ThemeState(themeMode: '${json[themeModeKey]}'.theme);

  @override
  Map<String, dynamic>? toJson(ThemeState state) =>
      {themeModeKey: state.themeMode.name};
}

// class ThemeStore extends HydratedCubit<ThemeType> {
//   ThemeStore() : super(ThemeType.light);
//
//   void setTheme(ThemeType themeType) => emit(themeType);
//
//   bool get isDarkTheme => state == ThemeType.dark;
//
//   @override
//   ThemeType? fromJson(Map<String, dynamic> json) =>
//       (json[themeTypeKey] as String).theme;
//
//   @override
//   Map<String, dynamic>? toJson(ThemeType state) => {themeTypeKey: state.name};
// }
