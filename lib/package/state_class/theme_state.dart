import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import '../../package/package/package.dart';

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});
  factory ThemeState.init() => ThemeState(themeMode: ThemeMode.system);

  FlexColorScheme get light => lightTheme;
  // ThemeData get light => lightTheme;
  FlexColorScheme get dark => darkTheme;
  // ThemeData get dark => darkTheme;

  ThemeState copyWith({ThemeMode? themeMode}) =>
      ThemeState(themeMode: themeMode ?? this.themeMode);
}

class AppTheme {
  static ThemeMode currentThemeMode = ThemeMode.light;
  static FlexSchemeData currentSchemeData = FlexSchemeData(
      name: 'color',
      description: 'description',
      light: FlexSchemeColor.from(primary: FlexColor.purpleM3LightPrimary),
      dark: FlexSchemeColor.from(primary: FlexColor.purpleM3DarkPrimary));

  static ThemeData lightTheme() {
    final FlexColorScheme colorScheme = FlexColorScheme.light(
      colors: currentSchemeData.light,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    );

    return colorScheme.toTheme;
  }

  static ThemeData darkTheme() {
    final FlexColorScheme colorScheme = FlexColorScheme.dark(
      colors: currentSchemeData.dark,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,

    );

    return colorScheme.toTheme;
  }

  static ThemeData customTheme(FlexSchemeData schemeData) {
    final FlexColorScheme colorScheme = FlexColorScheme(
      error: schemeData.light.error,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    );

    return colorScheme.toTheme;
  }

  static void setThemeMode(ThemeMode mode) {
    currentThemeMode = mode;
  }

  static void setCustomTheme(FlexSchemeData schemeData) {
    currentSchemeData = schemeData;
  }

  static ThemeData getTheme() {
    switch (currentThemeMode) {
      case ThemeMode.light:
        return lightTheme();
      case ThemeMode.dark:
        return darkTheme();
      default:
        return customTheme(currentSchemeData);
    }
  }
}
