import 'package:isolate_ejemplo/isolate_ejemplo.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}
