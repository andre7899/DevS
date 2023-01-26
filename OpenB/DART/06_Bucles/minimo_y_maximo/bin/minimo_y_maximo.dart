import 'dart:math';

void main(List<String> arguments) {
  var lista = [3, 41, 12, 73, 9, 2, 20];

  //calcular valor maximo
  var maximo = 0;
  for (var element in lista) {
    if (maximo < element) {
      maximo = element;
    }
    print('Ciclo: $maximo $element');
  }

  print('El máximo es $maximo');

  //Calcular el minimo
  var minimo;

  for (var numero in lista) {
    if (minimo == null || minimo > numero) {
      minimo = numero;
    }
    print('Ciclo: $minimo $numero');
  }
  print('El mínimo es $minimo');

  print('Otra manera con libreria Math...');
  print(lista.reduce(min));
  print(lista.reduce(max));
  print(lista.reduce((value, element) => value + element)); //suma de elementos
}
