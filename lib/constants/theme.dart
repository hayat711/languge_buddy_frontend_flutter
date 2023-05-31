import 'package:flutter/material.dart';
import 'package:language_buddy/constants/color_scheme.dart';


class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: myColorScheme,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,

      // Define other app bar properties
    ),
    scaffoldBackgroundColor: backgroundColor,
    // Define other theme properties such as typography, button styles, etc.
  );

  static final ThemeData darkTheme = ThemeData(
    // Define the dark theme if needed
  );
}
