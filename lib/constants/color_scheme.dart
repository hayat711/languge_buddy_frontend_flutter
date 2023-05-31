import 'package:flutter/material.dart';

// Define the modified colors
const primaryColor = Color(0xFF6B97F4);
const secondaryColor = Color(0xFF353A85);
const accentColor = Color(0xFFFF2E63);
const contentColor = Color(0xFF151328);
const backgroundColor = Color(0xFFFFFFFF);
const secondaryBackgroundColor = Color(0xFDCBC1C1);
const primaryContainerColor = Color(0xD3FFFFFF);

// Define the color scheme using the modified colors
const ColorScheme myColorScheme = ColorScheme(
  primary: primaryColor,
  primaryContainer: primaryColor,
  secondary: secondaryColor,
  secondaryContainer: secondaryColor,
  surface: contentColor,
  background: backgroundColor,
  error: Colors.red,
  onPrimary: contentColor,
  onSecondary: contentColor,
  onSurface: primaryColor,
  onBackground: contentColor,
  onError: contentColor,
  brightness: Brightness.light,
);


final ThemeData myTheme = ThemeData(
  colorScheme: myColorScheme,
  appBarTheme: const AppBarTheme(
    color: primaryColor,
    elevation: 0, // Customize the app bar elevation if needed
    // Define other app bar properties
  ),
  // Define other theme properties such as typography, button styles, etc.
);
