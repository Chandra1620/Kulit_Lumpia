import 'package:flutter_test/flutter_test.dart';
import 'package:kulit_lumpia/core/utils/currency_formatter.dart';

void main() {
  group('CurrencyFormatter Test', () {
    test('formatRupiah memformat angka ke standar Rupiah Indonesia', () {
      expect(CurrencyFormatter.formatRupiah(0), 'Rp0');
      expect(CurrencyFormatter.formatRupiah(500), 'Rp500');
      expect(CurrencyFormatter.formatRupiah(1000), 'Rp1.000');
      expect(CurrencyFormatter.formatRupiah(25000), 'Rp25.000');
      expect(CurrencyFormatter.formatRupiah(1500000), 'Rp1.500.000');
    });

    test('formatLembar menambahkan satuan lembar', () {
      expect(CurrencyFormatter.formatLembar(10), '10 lembar');
      expect(CurrencyFormatter.formatLembar(100), '100 lembar');
    });

    test('isValidQuantity memvalidasi minimum 10 dan kelipatan 10', () {
      // Nilai tidak valid (kurang dari 10)
      expect(CurrencyFormatter.isValidQuantity(0), false);
      expect(CurrencyFormatter.isValidQuantity(5), false);
      expect(CurrencyFormatter.isValidQuantity(9), false);

      // Nilai tidak valid (bukan kelipatan 10)
      expect(CurrencyFormatter.isValidQuantity(15), false);
      expect(CurrencyFormatter.isValidQuantity(23), false);
      expect(CurrencyFormatter.isValidQuantity(37), false);

      // Nilai valid
      expect(CurrencyFormatter.isValidQuantity(10), true);
      expect(CurrencyFormatter.isValidQuantity(20), true);
      expect(CurrencyFormatter.isValidQuantity(50), true);
      expect(CurrencyFormatter.isValidQuantity(100), true);
      expect(CurrencyFormatter.isValidQuantity(1000), true);
    });
  });
}

