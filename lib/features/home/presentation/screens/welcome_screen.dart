import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/config/env_config.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/app_button.dart';

/// Layar selamat datang dan verifikasi fondasi aplikasi Kulit Lumpia.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
              Card(
                color: AppColors.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppConstants.appName,
                        style: AppTypography.headingLarge.copyWith(color: AppColors.primary),
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        AppConstants.appTagline,
                        style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xs,
                          vertical: AppSpacing.xxs,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: AppSpacing.borderRadiusSmall,
                          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
                        ),
                        child: Text(
                          EnvConfig.isConfigured
                              ? 'Status Supabase: Terhubung'
                              : 'Status Supabase: Mode Placeholder (Aman)',
                          style: AppTypography.caption.copyWith(
                            color: EnvConfig.isConfigured ? AppColors.success : AppColors.warning,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              const Text(
                'Pengujian Rute Fondasi (Tahap 2)',
                style: AppTypography.titleMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              const Text(
                'Pilih peran untuk memverifikasi struktur navigasi awal:',
                style: AppTypography.bodySmall,
              ),
              const SizedBox(height: AppSpacing.md),

              // Tombol Rute Pembeli
              AppButton(
                text: 'Area Pembeli (Buyer)',
                icon: Icons.shopping_bag_outlined,
                onPressed: () => context.push('/buyer'),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Tombol Rute Admin
              AppButton(
                text: 'Area Admin (Operasional)',
                icon: Icons.admin_panel_settings_outlined,
                type: AppButtonType.outlined,
                onPressed: () => context.push('/admin'),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Tombol Rute Produksi
              AppButton(
                text: 'Area Produksi (Kepala Karyawan)',
                icon: Icons.precision_manufacturing_outlined,
                type: AppButtonType.outlined,
                onPressed: () => context.push('/production'),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Tombol Rute Kurir
              AppButton(
                text: 'Area Kurir (Pengiriman)',
                icon: Icons.local_shipping_outlined,
                type: AppButtonType.outlined,
                onPressed: () => context.push('/courier'),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Tombol Masuk
              AppButton(
                text: 'Halaman Masuk (Auth)',
                icon: Icons.login_outlined,
                type: AppButtonType.text,
                onPressed: () => context.push('/auth'),
              ),

              const SizedBox(height: AppSpacing.xl),

              // Info Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: const BoxDecoration(
                  color: AppColors.surfaceSubtle,
                  borderRadius: AppSpacing.borderRadiusMedium,
                  border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ketentuan Pemesanan Aktif:',
                      style: AppTypography.bodyMediumBold,
                    ),
                    SizedBox(height: AppSpacing.xxs),
                    Text(
                      '• Minimal pemesanan: ${AppConstants.minOrderQuantity} lembar\n'
                      '• Kelipatan pemesanan: ${AppConstants.orderQuantityMultiple} lembar\n'
                      '• Ongkir: Gratis (jangkauan diverifikasi admin)',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
