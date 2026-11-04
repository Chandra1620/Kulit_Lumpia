import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_typography.dart';
import 'app_button.dart';

/// Tampilan loading terstandarisasi.
class LoadingView extends StatelessWidget {
  final String message;

  const LoadingView({
    super.key,
    this.message = 'Memuat data...',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            message,
            style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

/// Tampilan kondisi data kosong (*Empty State*).
class EmptyView extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final String? actionText;
  final VoidCallback? onAction;

  const EmptyView({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.inbox_outlined,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64.0, color: AppColors.textDisabled),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: AppTypography.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              message,
              style: AppTypography.bodySmall,
              textAlign: TextAlign.center,
            ),
            if (actionText != null && onAction != null) ...[
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                text: actionText!,
                onPressed: onAction,
                type: AppButtonType.outlined,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Tampilan kondisi kesalahan (*Error State*) dengan opsi coba lagi.
class ErrorView extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    this.title = 'Terjadi Kendala',
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64.0, color: AppColors.error),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: AppTypography.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              message,
              style: AppTypography.bodySmall,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                text: 'Coba Lagi',
                onPressed: onRetry,
                icon: Icons.refresh,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

