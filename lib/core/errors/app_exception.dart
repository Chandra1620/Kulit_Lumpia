/// Kelas penanganan error aplikasi Kulit Lumpia.
/// Mengacu pada STYLEGUIDE.md: Bahasa Indonesia jelas, sopan, tanpa membuka detail internal database.
class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException(
    this.message, {
    this.code,
    this.originalError,
  });

  @override
  String toString() => message;

  factory AppException.network() => const AppException(
        'Koneksi internet bermasalah. Periksa jaringan Anda dan coba lagi.',
        code: 'NETWORK_ERROR',
      );

  factory AppException.unauthorized() => const AppException(
        'Sesi Anda telah berakhir atau Anda tidak memiliki akses ke halaman ini. Silakan masuk kembali.',
        code: 'UNAUTHORIZED',
      );

  factory AppException.server([String? message]) => AppException(
        message ?? 'Terjadi kendala pada server kami. Silakan coba beberapa saat lagi.',
        code: 'SERVER_ERROR',
      );

  factory AppException.validation(String message) => AppException(
        message,
        code: 'VALIDATION_ERROR',
      );
}

