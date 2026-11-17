import 'package:flutter_test/flutter_test.dart';
import 'package:kulit_lumpia/core/errors/failures.dart';

void main() {
  group('Failures', () {
    test('ValidationFailure holds message and optional code', () {
      const failure = ValidationFailure(
        message: 'Kuantitas minimal adalah 10 lembar',
        code: 'MIN_QUANTITY_REQUIRED',
      );
      expect(failure.message, 'Kuantitas minimal adalah 10 lembar');
      expect(failure.code, 'MIN_QUANTITY_REQUIRED');
      expect(failure.toString(), contains('ValidationFailure'));
    });

    test('NetworkFailure holds network message', () {
      const failure = NetworkFailure(
        message: 'Gagal terhubung ke jaringan',
      );
      expect(failure.message, 'Gagal terhubung ke jaringan');
      expect(failure.code, isNull);
    });

    test('AuthorizationFailure holds authorization message', () {
      const failure = AuthorizationFailure(
        message: 'Akses ditolak',
        code: 'FORBIDDEN',
      );
      expect(failure.code, 'FORBIDDEN');
    });
  });
}
