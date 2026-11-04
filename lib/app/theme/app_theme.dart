import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Konfigurasi ThemeData resmi aplikasi Kulit Lumpia.
/// Mengacu pada prinsip DESIGN.md (Anti-AI-slop, fungsional, kontras tinggi).
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        error: AppColors.error,
        onError: AppColors.onError,
        outline: AppColors.border,
      ),

      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0.0,
        scrolledUnderElevation: 1.0,
        centerTitle: false,
        titleTextStyle: AppTypography.titleLarge,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
      ),

      // Card Theme (Permukaan bersih, border tegas, tanpa bayangan berlebihan)
      cardTheme: const CardTheme(
        color: AppColors.surface,
        elevation: 0.0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMedium,
          side: BorderSide(color: AppColors.border, width: 1.0),
        ),
      ),

      // ElevatedButton Theme (Target sentuh minimal 48dp)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          minimumSize: const Size.fromHeight(AppSpacing.minTouchTarget),
          elevation: 0.0,
          shape: const RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusSmall,
          ),
          textStyle: AppTypography.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
        ),
      ),

      // OutlinedButton Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size.fromHeight(AppSpacing.minTouchTarget),
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusSmall,
          ),
          textStyle: AppTypography.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
        ),
      ),

      // TextButton Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(AppSpacing.minTouchTarget, AppSpacing.minTouchTarget),
          textStyle: AppTypography.labelLarge,
        ),
      ),

      // InputDecoration Theme (Border tegas, label jelas, error semantik)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        labelStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
        hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textDisabled),
        errorStyle: AppTypography.bodySmall.copyWith(color: AppColors.error),
        border: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSmall,
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSmall,
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSmall,
          borderSide: BorderSide(color: AppColors.borderFocus, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSmall,
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusSmall,
          borderSide: BorderSide(color: AppColors.error, width: 2.0),
        ),
      ),

      // Dialog Theme
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMedium,
        ),
        titleTextStyle: AppTypography.titleLarge,
        contentTextStyle: AppTypography.bodyMedium,
      ),

      // SnackBar Theme
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.textPrimary,
        contentTextStyle: TextStyle(color: Colors.white, fontSize: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusSmall,
        ),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1.0,
        space: 1.0,
      ),
    );
  }
}
