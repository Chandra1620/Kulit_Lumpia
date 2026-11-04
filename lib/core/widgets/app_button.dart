import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';

enum AppButtonType { primary, outlined, text }

/// Tombol standar aplikasi Kulit Lumpia dengan dukungan state loading.
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final AppButtonType type;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.type = AppButtonType.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: AppSpacing.minTouchTarget,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: null,
          child: SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ),
      );
    }

    Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20.0),
          const SizedBox(width: AppSpacing.xs),
        ],
        Text(text),
      ],
    );

    switch (type) {
      case AppButtonType.primary:
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            child: content,
          ),
        );
      case AppButtonType.outlined:
        return SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: onPressed,
            child: content,
          ),
        );
      case AppButtonType.text:
        return TextButton(
          onPressed: onPressed,
          child: content,
        );
    }
  }
}

