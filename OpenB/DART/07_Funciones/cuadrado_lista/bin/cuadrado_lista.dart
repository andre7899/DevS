void main(List<String> arguments) {
  var lista = [1, 2, 3, 4, 5];

  // ignore: avoid_function_literals_in_foreach_calls
  var listaCuadrado = calcularCuadrado(lista);
  print('Antigua lista: $lista');
  print('Nueva lista:  $listaCuadrado');
}

calcularCuadrado(List listaNumeros) {
  var nuevaLista = [];
  listaNumeros.forEach((element) => nuevaLista.add(element * element));
  return nuevaLista;
}
