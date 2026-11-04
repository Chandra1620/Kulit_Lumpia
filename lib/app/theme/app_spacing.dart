import 'package:flutter/material.dart';

/// Skala Spacing dan Ukuran sesuai DESIGN.md dan UX_DESIGN.md.
class AppSpacing {
  AppSpacing._();

  // Spacing kelipatan 4 dan 8
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Ukuran sentuh minimum aksesibilitas Android
  static const double minTouchTarget = 48.0;

  // Border Radius Semantik
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;

  static const BorderRadius borderRadiusSmall = BorderRadius.all(Radius.circular(radiusSmall));
  static const BorderRadius borderRadiusMedium = BorderRadius.all(Radius.circular(radiusMedium));
  static const BorderRadius borderRadiusLarge = BorderRadius.all(Radius.circular(radiusLarge));
}

