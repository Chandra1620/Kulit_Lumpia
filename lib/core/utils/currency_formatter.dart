/// Utilitas pemformatan mata uang dan kuantitas sesuai STYLEGUIDE.md.
class CurrencyFormatter {
  CurrencyFormatter._();

  /// Memformat angka numerik ke format Rupiah standar, misal: 25000 -> "Rp25.000".
  static String formatRupiah(num amount) {
    final int value = amount.round();
    final String str = value.abs().toString();
    final StringBuffer buffer = StringBuffer();

    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      buffer.write(str[i]);
      count++;
      if (count % 3 == 0 && i > 0) {
        buffer.write('.');
      }
    }

    final String reversed = buffer.toString().split('').reversed.join('');
    final String prefix = value < 0 ? '-Rp' : 'Rp';
    return '$prefix$reversed';
  }

  /// Memformat jumlah lembar kulit lumpia, misal: 100 -> "100 lembar".
  static String formatLembar(int sheets) {
    return '$sheets lembar';
  }

  /// Memvalidasi apakah jumlah lembar memenuhi aturan bisnis (min 10 dan kelipatan 10).
  static bool isValidQuantity(int quantity) {
    return quantity >= 10 && (quantity % 10 == 0);
  }
}

