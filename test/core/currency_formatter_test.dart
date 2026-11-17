import 'package:flutter_test/flutter_test.dart';
import 'package:kulit_lumpia/core/utils/currency_formatter.dart';

void main() {
  group('CurrencyFormatter', () {
    test('formats integer amount into standard Indonesian Rupiah format', () {
      expect(CurrencyFormatter.formatRupiah(0), 'Rp0');
      expect(CurrencyFormatter.formatRupiah(1000), 'Rp1.000');
      expect(CurrencyFormatter.formatRupiah(10000), 'Rp10.000');
      expect(CurrencyFormatter.formatRupiah(1000000), 'Rp1.000.000');
      expect(CurrencyFormatter.formatRupiah(2500000), 'Rp2.500.000');
    });

    test('formats compact representation accurately', () {
      expect(CurrencyFormatter.formatRupiahCompact(500), 'Rp500');
      expect(CurrencyFormatter.formatRupiahCompact(5000), 'Rp5 rb');
      expect(CurrencyFormatter.formatRupiahCompact(15000), 'Rp15 rb');
      expect(CurrencyFormatter.formatRupiahCompact(1000000), 'Rp1 jt');
      expect(CurrencyFormatter.formatRupiahCompact(2500000), 'Rp2.5 jt');
    });
  });
}
