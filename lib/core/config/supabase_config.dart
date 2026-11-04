import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'env_config.dart';

/// Pengelola inisialisasi Supabase SDK.
/// Menangani koneksi aman dan kondisi placeholder saat kredensial belum tersedia.
class SupabaseConfig {
  SupabaseConfig._();

  static bool _isInitialized = false;

  /// Status apakah Supabase SDK sudah terinisialisasi.
  static bool get isInitialized => _isInitialized;

  /// Client Supabase aktif.
  static SupabaseClient? get client =>
      _isInitialized ? Supabase.instance.client : null;

  /// Inisialisasi Supabase.
  /// Jika kredensial masih placeholder, inisialisasi dilewati secara aman
  /// sehingga aplikasi tetap dapat berjalan untuk pengujian UI/fondasi.
  static Future<void> initialize() async {
    if (!EnvConfig.isConfigured) {
      debugPrint(
        '[SupabaseConfig] Berjalan dalam mode placeholder/offline. '
        'Kredensial SUPABASE_URL atau SUPABASE_PUBLISHABLE_KEY belum dikonfigurasi.',
      );
      return;
    }

    try {
      await Supabase.initialize(
        url: EnvConfig.supabaseUrl,
        publishableKey: EnvConfig.supabasePublishableKey,
      );
      _isInitialized = true;
      debugPrint('[SupabaseConfig] Supabase berhasil diinisialisasi.');
    } catch (e, stackTrace) {
      debugPrint('[SupabaseConfig] Gagal inisialisasi Supabase: $e');
      debugPrint(stackTrace.toString());
      _isInitialized = false;
    }
  }
}
