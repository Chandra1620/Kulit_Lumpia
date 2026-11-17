import 'package:intl/intl.dart';

/// Utility class for formatting integer/bigint Rupiah amounts
/// Adheres to PRD.md Section 2.1 & STYLEGUIDE.md Section 4
class CurrencyFormatter {
  CurrencyFormatter._();

  static final NumberFormat _formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  /// Format an integer/bigint rupiah amount to standard format: e.g. Rp1.000.000
  static String formatRupiah(int amount) {
    return _formatter.format(amount);
  }

  /// Compact representation for summaries if needed
  static String formatRupiahCompact(int amount) {
    if (amount >= 1000000) {
      final double millions = amount / 1000000.0;
      return 'Rp${millions.toStringAsFixed(millions.truncateToDouble() == millions ? 0 : 1)} jt';
    } else if (amount >= 1000) {
      final double thousands = amount / 1000.0;
      return 'Rp${thousands.toStringAsFixed(thousands.truncateToDouble() == thousands ? 0 : 1)} rb';
    }
    return formatRupiah(amount);
  }
}
