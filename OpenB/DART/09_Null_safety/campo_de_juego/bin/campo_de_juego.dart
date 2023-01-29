int? couldReturnNullButDoesnt() => -3;
void main(List<String> arguments) {
  // int? a;
  // a = null;
  // print('a es $a');

  List<String> aListOfStrings = ['one', 'two', 'three'];
  List<String>? aNullableListOfString; //coleccion nulable
  List<String?> aListOfNullableStrings = [
    'one',
    null,
    'three'
  ]; //coleccion de elemetno nulables

  print('aListOfStrings is $aListOfStrings');
  print('aNullableListOfString is $aNullableListOfString');
  print('aListOfNullableStrings is $aListOfNullableStrings');

  int? couldBeNullButIsnt = 1;
  List<int?> listTahtCouldHoldNulls = [2, null, 4];

  int a = couldBeNullButIsnt;
  int b = listTahtCouldHoldNulls.first!;
  int c = couldReturnNullButDoesnt()!.abs();

  print('a is $a');
  print('b is $b');
  print('c is $c');

  String? valor;

  print(valor);

  print(getLength(null));
  print('Funciona');
}

// int getLength(String? str) {
//   if (str == null) {
//     return 0;
//   } else {
//     return str.length;
//   }
// }

int getLength(String? str) {
  if (str == null) {
    throw FormatException();
  } else {
    return str.length;
  }
}
