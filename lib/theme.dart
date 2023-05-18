import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData darkThemeData = ThemeData(
      colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    background: Color(0xFF17223B),
    primary: Color(0xFF263859),
    secondary: Color.fromARGB(255, 61, 158, 222),
    tertiary: Color(0xFFFFFFFF), 
    error: Colors.red,
    onError: Colors.red,
    onBackground: Colors.black,
    surface: Color(0xFF393E46),
    onSurface: Colors.white,
    onPrimary: Colors.black54,
    onSecondary: Colors.black45,
  ));

  static ThemeData lightThemeData = ThemeData(
      colorScheme: const ColorScheme(
    brightness: Brightness.light,
    background: Colors.white,
    primary: Colors.grey,
    secondary: Color(0xFF3282B8),
    tertiary: Colors.amber, 
    error: Colors.red,
    onError: Colors.red,
    onBackground: Colors.black,
    surface: Color(0xFF393E46),
    onSurface: Colors.white,
    onPrimary: Colors.black54,
    onSecondary: Colors.black45,
  ));
}


