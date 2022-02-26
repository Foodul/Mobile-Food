import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  // ThemeData get theme => redTheme;
  @override
  ThemeData get theme => ThemeData(
        fontFamily: AppConstants.FONT_FAMILY,
        colorScheme: _appColorScheme,
        textTheme: textTheme,
        scaffoldBackgroundColor: _appColorScheme.background,
        textButtonTheme: textButtonTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        outlinedButtonTheme: outlinedButtonThemeData,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
          disabledBorder: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(),
          contentPadding: EdgeInsets.all(0),
        ),
        appBarTheme: AppBarTheme(
            // titleSpacing: 0,
            centerTitle: false,
            color: _appColorScheme.surface,
            titleTextStyle: textTheme.headline5
            // elevation: 0,
            ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: _appColorScheme.primary,
        ),
      );

  TextButtonThemeData get textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: _appColorScheme.primary,
        textStyle: textTheme.button,
      ),
    );
  }

  ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 3,
          primary: _appColorScheme.primary,
          textStyle: textTheme.button),
    );
  }

  OutlinedButtonThemeData get outlinedButtonThemeData =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: _appColorScheme.primary,
          textStyle: textTheme.button,
          side: const BorderSide(
            width: 2,
          ),
        ),
      );

  TextTheme get textTheme {
    return ThemeData.light().textTheme.copyWith(
          // ignore: prefer_const_constructors
          headline1: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.tertiary,
          ),
          headline2: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.tertiary,
          ),
          headline3: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.onTertiaryContainer,
          ),
          headline4: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.onTertiaryContainer,
          ),
          headline5: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.onTertiaryContainer,
          ),
          headline6: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.onTertiaryContainer,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _appColorScheme.onTertiaryContainer,
          ),
          bodyText2: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: _appColorScheme.onTertiaryContainer,
          ),
          subtitle2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _appColorScheme.onTertiaryContainer,
          ),
          caption: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _appColorScheme.onTertiaryContainer,
          ),
          button: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          overline: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: _appColorScheme.onSecondary,
              letterSpacing: 0.5),
        );
  }

  ColorScheme get _appColorScheme {
    return const ColorScheme(
      onBackground: Colors.white,
      background: Color(0xFFF6F5F5), //bg
      onError: Colors.white,
      error: Colors.redAccent,
      onPrimary: Colors.white,
      primary: Color(0xFF51DC8E), //green
      onSecondary: Colors.white,
      secondary: Color(0xFF483FF7), //pripurble
      onSurface: Colors.white,
      surface: Colors.white,
      tertiaryContainer: Color(0xFF141414), //text / dark
      tertiary: Color(0xFF2D0C57), //text / darkPurble
      onTertiaryContainer: Color(0xFF8F92A1), //text / textGrey
      onTertiary: Color(0xFF5E6375), //text / grey
      brightness: Brightness.light,
      
    );
  }
}
