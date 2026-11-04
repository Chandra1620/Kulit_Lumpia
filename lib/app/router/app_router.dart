import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/state_views.dart';
import '../../features/admin/presentation/screens/admin_placeholder_screen.dart';
import '../../features/auth/presentation/screens/auth_placeholder_screen.dart';
import '../../features/buyer/presentation/screens/buyer_placeholder_screen.dart';
import '../../features/courier/presentation/screens/courier_placeholder_screen.dart';
import '../../features/home/presentation/screens/welcome_screen.dart';
import '../../features/production/presentation/screens/production_placeholder_screen.dart';

/// Konfigurasi GoRouter aplikasi Kulit Lumpia.
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (context, state) => const AuthPlaceholderScreen(),
      ),
      GoRoute(
        path: '/buyer',
        name: 'buyer',
        builder: (context, state) => const BuyerPlaceholderScreen(),
      ),
      GoRoute(
        path: '/admin',
        name: 'admin',
        builder: (context, state) => const AdminPlaceholderScreen(),
      ),
      GoRoute(
        path: '/production',
        name: 'production',
        builder: (context, state) => const ProductionPlaceholderScreen(),
      ),
      GoRoute(
        path: '/courier',
        name: 'courier',
        builder: (context, state) => const CourierPlaceholderScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Halaman Tidak Ditemukan')),
      body: ErrorView(
        title: 'Halaman Tidak Ditemukan',
        message: 'Rute ${state.uri} tidak tersedia di aplikasi.',
        onRetry: () => context.go('/'),
      ),
    ),
  );
}
