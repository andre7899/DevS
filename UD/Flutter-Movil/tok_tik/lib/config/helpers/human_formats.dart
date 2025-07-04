import 'package:intl/intl.dart';

class HumanFormats {
  // usar intl para numeros
  static String humanReadbleNumber(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    );

    return formatterNumber.format(number);
  }
}
