import 'package:test/test.dart';

import 'galletadegengibre.dart';

void main(List<String> arguments) {
  var tom = GalletaDeJengibre(
      'Tom', 30); //tmb se puede poner como tipo de dato el nombre de la clase
  tom.nacer();
  print('El nombre de tu galleta de gengibre es ${tom.nombre}');
  print('Tipo de galleta: ${tom.tipo} ');
  print('Edad: ${tom.edad} ');

  var mary = GalletaDeJengibre(
      'Mary', 23); //tmb se puede poner como tipo de dato el nombre de la clase
  mary.nacer();
  mary.edad = 100;
  print('El nombre de tu galleta de gengibre es ${mary.nombre}');
  print('Tipo de galleta: ${mary.tipo} ');
  print('Edad: ${mary.edad} ');

  var jerry = GalletaDeJengibre.avanzada('Jerry', 13,
      tipo: 'sin Gluten', sabeDarVolteretas: true);
  jerry.nacer();
  print('El nombre de tu galleta de gengibre es ${jerry.nombre}');
  print('Tipo de galleta: ${jerry.tipo} ');
  print('Edad: ${jerry.edad} ');
  print('Sabe dar volteretas???');

  //se comprueba que no sea null con "!"
  jerry.sabeDarVolteretas! ? print('Sí sabe') : print('No sabe');

  var desconocido = GalletaDeJengibre.sinDatos(25);
  var semiAvanzada =
      GalletaDeJengibre.semiAvanzada('Nombre', 30, tipo: 'Chocolate blanco');

  //Curso de volteretas
  bool volteretaTom = tom.aprenderVoltereta();
  bool volteretaMary = mary.aprenderVoltereta();
  bool volteretaJerry = jerry.aprenderVoltereta();

  volteretaTom ? print('Tom ha aprendido') : print('Tom no ha aprendido');
  volteretaMary ? print('Mary ha aprendido') : print('Mary no ha aprendido');
  volteretaJerry ? print('Jerry ha aprendido') : print('Jerry no ha aprendido');
}
