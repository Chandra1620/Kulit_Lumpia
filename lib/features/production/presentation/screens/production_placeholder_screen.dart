import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Halaman placeholder area produksi (Tahap 2).
class ProductionPlaceholderScreen extends StatelessWidget {
  const ProductionPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Antrean Produksi'),
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
                      Text('Area Kepala Karyawan (Produksi)', style: AppTypography.titleMedium),
                      SizedBox(height: AppSpacing.xs),
                      Text(
                        'Rute siap. Fitur pemantauan batch kekurangan stok, pencatatan progres, '
                        'dan penyelesaian target cetak lembar kulit lumpia akan diimplementasikan pada Tahap 7.',
                        style: AppTypography.bodySmall,
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Chip(
                        label: Text('Role: ${AppConstants.roleProduction}'),
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
