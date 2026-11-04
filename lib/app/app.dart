import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants/app_constants.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

/// Widget akar aplikasi Kulit Lumpia.
class KulitLumpiaApp extends ConsumerWidget {
  const KulitLumpiaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}

