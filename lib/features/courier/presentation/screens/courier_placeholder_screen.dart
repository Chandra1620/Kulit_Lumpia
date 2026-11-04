import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Halaman placeholder area kurir (Tahap 2).
class CourierPlaceholderScreen extends StatelessWidget {
  const CourierPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Pengiriman Kurir'),
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
                      Text('Area Kurir (Pengiriman)', style: AppTypography.titleMedium),
                      SizedBox(height: AppSpacing.xs),
                      Text(
                        'Rute siap. Fitur daftar tugas antar, penagihan uang COD, '
                        'pengambilan foto bukti serah terima paket, dan laporan kendala akan diimplementasikan pada Tahap 8.',
                        style: AppTypography.bodySmall,
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Chip(
                        label: Text('Role: ${AppConstants.roleCourier}'),
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
