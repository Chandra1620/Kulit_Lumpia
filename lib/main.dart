import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'core/config/supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Supabase (Mode placeholder aman jika kredensial belum diisi)
  await SupabaseConfig.initialize();

  runApp(
    const ProviderScope(
      child: KulitLumpiaApp(),
    ),
  );
}

