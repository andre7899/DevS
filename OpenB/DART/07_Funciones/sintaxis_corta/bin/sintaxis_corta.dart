import 'dart:ffi';

void main(List<String> arguments) {
  imprimirHolaMundo();
  imprimirHolamundo2();
  print(amor('Maria'));
  print(amor2('Maria'));
  print('El area es ${calcularArea(2, 5)}');

  print(numero(2, 3));
  print(funcionx(1, 2, 3));
}

void imprimirHolaMundo() {
  print('Hola mundo');
}

numero(int a, int b) => a * b;
imprimirHolamundo2() => print('Hola Mundo'); //sintaxis corta

String amor(tuNombre) => 'Te quiero $tuNombre'; //sintaxis corta
amor2(String tuNombre) {
  return 'Te quiero $tuNombre';
}

int calcularArea(a, int b) => a * b;

funcionx(a, b, c) {
  return a + b + c;
}
