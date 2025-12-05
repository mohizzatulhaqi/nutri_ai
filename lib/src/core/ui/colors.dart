import 'package:flutter/material.dart';

/// A class that holds the color palette for the app.
class AppColors {
  /// The primary color of the app.
  static const Color primary = Color(0xFF0D47A1);

  /// A darker shade of the primary color.
  static const Color primaryDark = Color(0xFF002171);

  /// A lighter shade of the primary color.
  static const Color primaryLight = Color(0xFF5472D3);

  /// The accent color of the app.
  static const Color accent = Color(0xFFFFAB00);

  /// The primary text color.
  static const Color textPrimary = Color(0xFF212121);

  /// The secondary text color.
  static const Color textSecondary = Color(0xFF757575);

  /// The background color of the app.
  static const Color background = Color(0xFFF5F5F5);

  /// The surface color for elements like cards.
  static const Color surface = Colors.white;

  /// The color for error messages.
  static const Color error = Color(0xFFB00020);

  /// A standard grey color.
  static const Color grey = Color(0xFF9E9E9E);

  // Gradient colors for UI components
  /// Pink gradient colors for header/hero sections
  static const List<Color> pinkGradient = [
    Color(0xFFE91E63),
    Color(0xFFAD1457),
  ];

  /// Blue gradient colors for content sections
  static const List<Color> blueGradient = [
    Color(0xFF2196F3),
    Color(0xFF0D47A1),
  ];

  /// Green gradient colors for search and action elements
  static const List<Color> greenGradient = [
    Color(0xFF4CAF50),
    Color(0xFF2E7D32),
  ];

  /// Purple gradient colors for special sections
  static const List<Color> purpleGradient = [
    Color(0xFF9C27B0),
    Color(0xFF6A1B9A),
  ];

  /// Orange gradient colors for accent elements
  static const List<Color> orangeGradient = [
    Color(0xFFFF9800),
    Color(0xFFE65100),
  ];

  /// Light gradient colors for background overlays
  static const List<Color> lightGradient = [
    Color(0xFFFFFFFF),
    Color(0xFFF5F5F5),
  ];
}
