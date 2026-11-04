import 'package:flutter/material.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';

/// Halaman placeholder autentikasi untuk pengujian navigasi (Tahap 2).
class AuthPlaceholderScreen extends StatelessWidget {
  const AuthPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masuk'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selamat Datang Kembali',
                style: AppTypography.headingMedium,
              ),
              const SizedBox(height: AppSpacing.xxs),
              const Text(
                'Masuk menggunakan akun terdaftar Anda.',
                style: AppTypography.bodySmall,
              ),
              const SizedBox(height: AppSpacing.lg),
              const AppTextField(
                label: 'Email',
                hint: 'nama@email.com',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email_outlined),
              ),
              const AppTextField(
                label: 'Kata Sandi',
                hint: 'Masukkan kata sandi',
                obscureText: true,
                prefixIcon: Icon(Icons.lock_outline),
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton(
                text: 'Masuk (Placeholder)',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fondasi siap: Fitur login aktif akan dihubungkan di Tahap 4.'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
