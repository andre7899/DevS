import 'dart:io';

void main(List<String> arguments) {
  var n = 5;
  while (true) {
    String? linea = stdin.readLineSync();
    if (linea.toString().startsWith('#')) {
      //convettir a string
      continue;
    } else if (linea == 'fin') {
      break;
    }
    print('Repito: $linea');
  }

  //aqui
}
