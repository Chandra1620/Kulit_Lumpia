import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kulit_lumpia/app/app.dart';

void main() {
  testWidgets('KulitLumpiaApp smoke test and initial screen render', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: KulitLumpiaApp(),
      ),
    );

    // Initial render
    await tester.pumpAndSettle();

    // Verify app title and placeholder text are rendered
    expect(find.text('Kulit Lumpia'), findsWidgets);
    expect(find.textContaining('Fondasi aplikasi mobile berhasil disiapkan'), findsOneWidget);
  });
}
