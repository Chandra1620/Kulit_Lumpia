import 'package:flutter/material.dart';

/// Semantic Design Tokens warna aplikasi Kulit Lumpia.
/// Mengacu pada DESIGN.md Bagian Design Tokens dan UX_DESIGN.md Bagian 8.
class AppColors {
  AppColors._();

  // Warna Primer (Aksen hangat tanah/panggang yang tenang khas kulit lumpia)
  static const Color primary = Color(0xFFB25E1A);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryLight = Color(0xFFE08D4C);
  static const Color primaryContainer = Color(0xFFFBEADB);

  // Permukaan dan Latar Belakang (Netral dan ramah di mata)
  static const Color background = Color(0xFFF9F9F8);
  static const Color onBackground = Color(0xFF1C1C1A);

  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1C1C1A);
  static const Color surfaceSubtle = Color(0xFFF1F1EF);

  // Batas (Borders) & Pemisah (Dividers)
  static const Color border = Color(0xFFE2E2DF);
  static const Color borderFocus = Color(0xFFB25E1A);

  // Warna Teks
  static const Color textPrimary = Color(0xFF1C1C1A);
  static const Color textSecondary = Color(0xFF656560);
  static const Color textDisabled = Color(0xFFA0A09B);

  // Warna Semantik Status
  static const Color success = Color(0xFF2E7D32); // Disetujui, Lunas, Terkirim
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFFE8F5E9);

  static const Color warning = Color(0xFFED6C02); // Pending, Produksi, COD
  static const Color onWarning = Color(0xFFFFFFFF);
  static const Color warningContainer = Color(0xFFFFF3E0);

  static const Color error = Color(0xFFD32F2F); // Ditolak, Dibatalkan, Error
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFEBEE);

  static const Color info = Color(0xFF0288D1); // Info, Instruksi Transfer
  static const Color onInfo = Color(0xFFFFFFFF);
  static const Color infoContainer = Color(0xFFE1F5FE);
}

