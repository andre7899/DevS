import 'dart:io';

void main(List<String> arguments) {
  String? nombre;

  try {
    String nombreMayus = nombre!.toUpperCase();
  } catch (e) {
    print('Error en Uppercase: ${e.toString()}');
  } finally {
    //permite que el programa siga ejecutandose
    print('Haz esto si o si con finally sin terminar el programa');
  }

  int a = 20, b = 0;
  var res;

  //es como un if else
  try {
    res = division(a, b); //division entera
  } on UnsupportedError {
    print('No se puede dividir entre cero!');
  } on HttpException {
    print('No se puede dividir entre 0');
  } catch (e) {
    print(e.toString());
  } finally {
    print('Sumando 1 al denominador');
    res = division(a, b + 1);
  }
  print('El resultado es $res');

  try {
    res = division(a, b);
  } on UnsupportedError {
    print('Estoy aqui');
  } on FormatException {
    print('Estoy alla');
  } catch (e) {
    print(e.toString());
  }
}

int division(int a, int b) {
  if (b <= 0) {
    throw FormatException('El denominador es cero o menor');
  }
  return a ~/ b;
}
