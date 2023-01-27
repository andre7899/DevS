main(List<String> arguments) {
  var listaA = [3];
  listaA.add(1);
  listaA.add(2);
  listaA.add(24);

  print('Lista sin cascada');
  listaA.forEach(
      print); // se puede colocar defrente la funcion print para cada elemento

  var listaB = [];

  //ejecucion en cascada
  listaB
    ..add(3)
    ..add(1)
    ..add(2)
    ..add(24);

  print('Lista con cascada');
  listaB.forEach(print);

  var elementoTablaPeriodica = [];
  elementoTablaPeriodica
    ..add('Litio')
    ..add('Hidrogeno')
    ..add('Potasio')
    ..add('Sodio');

  elementoTablaPeriodica.forEach(print);
}
