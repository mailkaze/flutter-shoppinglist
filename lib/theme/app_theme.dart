import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.orange;
  static final Color backgroundColor = Colors.orange.shade300;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      elevation: 3,
    ),
  );
}
