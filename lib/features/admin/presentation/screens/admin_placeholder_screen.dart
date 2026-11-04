import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Halaman placeholder area admin (Tahap 2).
class AdminPlaceholderScreen extends StatelessWidget {
  const AdminPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Operasional Admin'),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Area Admin (Operasional)', style: AppTypography.titleMedium),
                      SizedBox(height: AppSpacing.xs),
                      Text(
                        'Rute siap. Fitur persetujuan/penolakan pesanan, manajemen stok, '
                        'verifikasi bukti transfer & COD, serta penugasan kurir akan diimplementasikan pada Tahap 6.',
                        style: AppTypography.bodySmall,
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Chip(
                        label: Text('Role: ${AppConstants.roleAdmin}'),
                        backgroundColor: AppColors.surfaceSubtle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
