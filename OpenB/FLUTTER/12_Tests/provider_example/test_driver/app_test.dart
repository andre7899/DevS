import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  group('Probando counter  provider', () {
    final incrementButton = find.byValueKey('increment');
    final counterText = find.byValueKey('countertext');

    late final FlutterDriver driver;

    //inicializamos
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    //desconectarlo
    tearDownAll(() async {
      driver.close();
    });

    test('Probar botón encrementar', () async {
      await driver.tap(incrementButton);

      final readtext = await driver.getText(counterText);
      expect(readtext, '1');
    });

    final textfieldf = find.byValueKey('textfield');

    test('Test sobre Textfield', () async {
      await driver.setTextEntryEmulation(enabled: true);

      await driver.tap(textfieldf);
      await driver.enterText('Esto es un texto desde driver');
      await driver.enterText('Wow!');
    });
  });
}
