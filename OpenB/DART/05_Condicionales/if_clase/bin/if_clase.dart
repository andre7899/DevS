void main(List<String> arguments) {
  var cielo = "azul";
  var hora = 9;

  if (cielo == 'azul' && hora >= 9) {
    print('entonces es de día');
  }

  if (true) {
    print('Me estoy ejecutando');
  }

  var numero = 1;

  if (numero % 2 == 0) {
    print('el número es par');
  } else {
    print('el numero es impar');
  }

  var edad1 = 17, edad2 = 37;

  if (edad2 - edad1 == 0) {
    print('Ambas edades son iguales');
  } else {
    var diferencia = edad2 - edad1;
    print('La diferencia de edad es ${edad2 - edad1}');
  }

  var luisCanta = true;
  if (luisCanta) {
    print('Corre que llueve');
  } else {
    print('Estas a salvo');
  }

  //Detector de milenials 1981-1997

  var anhoNacimiento = 1997;

  var genero = 'hombre';

  if (anhoNacimiento < 1981) {
    print('No hay milenials a la vista');
  } else if (anhoNacimiento > 1997) {
    print('No hay milenialls a la vista');
  } else {
    if (genero == 'hombre') {
      print('Eres milenial hombre');
    } else if (genero == 'mujer') {
      print('Eres milenial mujer');
    } else {
      print('Eres milenial sin un sexo reconocido por el programa');
    }
  }
}
