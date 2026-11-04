/// Konfigurasi environment yang aman untuk aplikasi Kulit Lumpia.
/// Mengacu pada SECURITY.md dan AGENTS.md.
class EnvConfig {
  EnvConfig._();

  /// URL Supabase Project.
  /// Dapat diisi via --dart-define=SUPABASE_URL=... saat compile,
  /// atau menggunakan nilai default placeholder.
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://placeholder-project.supabase.co',
  );

  /// Anon / Public API Key Supabase (legacy name).
  /// CATATAN KEAMANAN: HANYA Anon / Publishable Key yang boleh ada di aplikasi ini.
  /// DILARANG KERAS MENGGUNAKAN SERVICE_ROLE KEY.
  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'placeholder-anon-key',
  );

  /// Publishable Key Supabase (standar Supabase SDK terbaru).
  static const String supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
    defaultValue: supabaseAnonKey,
  );

  /// Memeriksa apakah konfigurasi telah menggunakan kredensial aktif atau masih placeholder.
  static bool get isConfigured =>
      supabaseUrl != 'https://placeholder-project.supabase.co' &&
      supabasePublishableKey != 'placeholder-anon-key' &&
      supabaseUrl.isNotEmpty &&
      supabasePublishableKey.isNotEmpty;
}
