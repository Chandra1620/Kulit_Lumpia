import 'package:flutter/material.dart';

/// Semantic color tokens for Kulit Lumpia application
/// Adheres to STYLEGUIDE.md Section 3
class AppColors {
  AppColors._();

  // Light Palette Tokens
  static const Color lightBackground = Color(0xFFF9F9F8);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceMuted = Color(0xFFF1F1EF);
  static const Color lightTextPrimary = Color(0xFF1A1A19);
  static const Color lightTextSecondary = Color(0xFF686864);
  static const Color lightBorder = Color(0xFFE2E2DF);
  
  // Warm Accent (derived from lumpia golden-warm tone, functional & restrained)
  static const Color accent = Color(0xFFB45309); // Amber-700 / Golden warm
  static const Color accentLight = Color(0xFFD97706);
  static const Color accentDark = Color(0xFF92400E);

  // Status & Feedback Colors
  static const Color success = Color(0xFF15803D); // Green-700
  static const Color warning = Color(0xFFB45309); // Amber-700
  static const Color danger = Color(0xFFB91C1C);  // Red-700
  static const Color info = Color(0xFF1D4ED8);    // Blue-700

  // Dark Palette Tokens
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkSurfaceMuted = Color(0xFF282828);
  static const Color darkTextPrimary = Color(0xFFF3F3F3);
  static const Color darkTextSecondary = Color(0xFFA0A0A0);
  static const Color darkBorder = Color(0xFF333333);
}
