import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../shared/widgets/state_views.dart';

/// Provider for application router configuration
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: 'root',
        builder: (context, state) => const _AppPlaceholderScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Halaman Tidak Ditemukan')),
      body: AppErrorView(
        message: 'Halaman yang Anda tuju tidak ditemukan (${state.uri.path}).',
        retryLabel: 'Kembali ke Beranda',
        onRetry: () => context.go('/'),
      ),
    ),
  );
});

/// Clean initial placeholder screen verifying the foundation setup
class _AppPlaceholderScreen extends StatelessWidget {
  const _AppPlaceholderScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kulit Lumpia'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.accent.withAlpha(25),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.restaurant_menu,
                  size: 32,
                  color: AppColors.accent,
                ),
              ),
              AppSpacing.vertical20,
              Text(
                'Kulit Lumpia',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              AppSpacing.vertical8,
              Text(
                'Fondasi aplikasi mobile berhasil disiapkan.\nSiap untuk integrasi backend dan fitur bisnis.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
