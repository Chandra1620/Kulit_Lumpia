import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Halaman placeholder area pembeli (Tahap 2).
class BuyerPlaceholderScreen extends StatelessWidget {
  const BuyerPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Pembeli'),
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
                      Text('Area Pembeli (Buyer)', style: AppTypography.titleMedium),
                      SizedBox(height: AppSpacing.xs),
                      Text(
                        'Rute siap. Halaman katalog, pemilihan variasi kelipatan 10, '
                        'keranjang, checkout, dan riwayat pesanan akan diimplementasikan pada Tahap 5.',
                        style: AppTypography.bodySmall,
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Chip(
                        label: Text('Role: ${AppConstants.roleBuyer}'),
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
