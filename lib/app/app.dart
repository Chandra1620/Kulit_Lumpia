import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

/// Widget akar aplikasi Kulit Lumpia.
class KulitLumpiaApp extends StatelessWidget {
  const KulitLumpiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}

