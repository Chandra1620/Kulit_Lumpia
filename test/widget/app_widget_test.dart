import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulit_lumpia/app/app.dart';
import 'package:kulit_lumpia/core/constants/app_constants.dart';

void main() {
  testWidgets('Aplikasi Kulit Lumpia dapat dirender dan menampilkan layar awal', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: KulitLumpiaApp(),
      ),
    );

    // Verifikasi judul aplikasi muncul di App Bar
    expect(find.text(AppConstants.appName), findsAtLeastNWidgets(1));

    // Verifikasi tagline muncul
    expect(find.text(AppConstants.appTagline), findsOneWidget);

    // Verifikasi tombol pengujian rute role tersedia
    expect(find.text('Area Pembeli (Buyer)'), findsOneWidget);
    expect(find.text('Area Admin (Operasional)'), findsOneWidget);
    expect(find.text('Area Produksi (Kepala Karyawan)'), findsOneWidget);
    expect(find.text('Area Kurir (Pengiriman)'), findsOneWidget);
  });
}

