void main(List<String> arguments) {
  var gastos = [1.23, 14.5, 300.67, 0.6, 125.5];

  var cuenta = 0;
  double suma = 0;

  //contar el numero de elementos y sumarlos
  for (var gasto in gastos) {
    cuenta++;
  }

  var lengthGastos = gastos.length;

  print('Elnumero total de gastos es $cuenta');

  for (var gasto in gastos) {
    suma += gasto;
  }

  String sumaString = suma.toStringAsFixed(2);

  print('En total de gastos es de $sumaString euros');
}
