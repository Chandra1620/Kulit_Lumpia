import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Skala Tipografi aplikasi Kulit Lumpia sesuai DESIGN.md dan STYLEGUIDE.md.
class AppTypography {
  AppTypography._();

  static const TextStyle headingLarge = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.2,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: -0.2,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle bodyMediumBold = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.3,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
}
