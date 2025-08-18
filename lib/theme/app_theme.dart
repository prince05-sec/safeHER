import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
    primaryColor: Colors.pink,
    // Note: I removed GoogleFonts since it seems to be a mock implementation
    // Replace with actual GoogleFonts package when ready
  );
}

// Temporary class for the mock GoogleFonts
// Remove when adding the actual google_fonts package dependency
class GoogleFonts {
  static poppinsTextTheme() {
    return const TextTheme();
  }
}
