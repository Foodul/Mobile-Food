import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  // ThemeData get theme => redTheme;
  @override
  ThemeData get theme => ThemeData(
      fontFamily: AppConstants.FONT_FAMILY,
      colorScheme: _appColorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: _appColorScheme.background,
      textButtonTheme: textButtonTheme,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: const UnderlineInputBorder(),
        disabledBorder: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(),
        contentPadding: const EdgeInsets.all(0),
      ),
      appBarTheme: const AppBarTheme(
        titleSpacing: 0,
        centerTitle: false,
        color: Colors.transparent,
        elevation: 0,
      ));

  TextButtonThemeData get textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: _appColorScheme.surface,
        backgroundColor: _appColorScheme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        textStyle: textTheme.button,
        elevation: 10,
        shadowColor: const Color(0xFF9595BC),
      ),
    );
  }

  TextTheme get textTheme {
    return ThemeData.dark().textTheme.copyWith(
          headline1: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          headline3: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          headline4: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          headline5: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          headline6: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.primary,
          ),
          bodyText1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _appColorScheme.background,
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _appColorScheme.background,
          ),
          button: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          caption: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
        );
  }

  ColorScheme get _appColorScheme {
    return const ColorScheme(
      primary: Color(0xFF0D1C2E),
      primaryVariant: Color(0xFF425466),
      secondary: Color(0xFF3E66FB),
      secondaryVariant: Color(0xFF03249D),
      surface: Colors.white,
      background: Color(0xFFF0F3F5),
      error: Color(0xFFEC002D),
      onPrimary: Color(0xFFE2E6EC),
      onSecondary: Color(0xFF838F9C),
      onSurface: Color(0xFFEC7F00),
      onBackground: Color(0xFF469E7B),
      onError: Color(0xFF00C382),
      brightness: Brightness.dark,
    );
  }
}
