import 'package:flutter_test/flutter_test.dart';
import 'package:testing_example/fraction.dart';

void main() {
  group('Testeando Fraction', () {
    test('10 dividido entre 2 deberia ser 5', () {
      final fraction = Fraction(
        numerator: 10,
        denominator: 2,
      );

      expect(fraction.toDouble, 5.0);
    });

    test(
      'Negate deberia devolver el signo opuesto',
      () {
        final fraction = Fraction(
          numerator: 10,
          denominator: 2,
        );
        fraction.negate();
        expect(fraction.toDouble, -5);
      },
    );
  });
}
