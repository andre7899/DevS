import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print('Introduce un numero maximo: ');
  var valorMax = stdin.readLineSync();
  var valorMaxInt;

  if (valorMax == null) {
    print('Error, intentelo de nuevo');
    exit(0);
  }

  if (int.tryParse(valorMax) != null) {
    //tryparse devuelve nulo si la cadena es diferente de entero
    valorMaxInt = int.parse(valorMax);

    if (valorMaxInt <= 0) {
      print('Introduce un numero mayor que 0 la proxima vez');
      exit(0);
    }
  } else {
    print('Introduce un número la proxima vez');
    exit(0);
  }

  Random random = Random(); //generar numero random
  var numeroAleatorio = random.nextInt(valorMaxInt) + 1;
  var numeroIntentos = 0;

  while (true) {
    numeroIntentos++;
    print('Introduce tu respuesta: ');
    var numero_introducido = stdin.readLineSync();
    var numero_introducido_int;

    if (numero_introducido == null) {
      print('Error, intentelo de nuevo');
      exit(0);
    }

    if (int.tryParse(numero_introducido) != null) {
      //tryparse devuelve nulo si la cadena es diferente de entero
      numero_introducido_int = int.parse(numero_introducido);
      if (numero_introducido_int <= 0) {
        //esto afecta en el random
        print('Introduce un numero mayor que 0 la proxima vez');
        exit(0);
      }
    } else {
      print('Introduce un número la proxima vez');
      exit(0);
    }

    if (numero_introducido_int == numeroAleatorio) {
      print('Lo has acertdo!');
      break;
    } else if (numero_introducido_int < numeroAleatorio) {
      print('El numero secreto es mayor, vuelve a intentarlo');
    } else {
      print('El numero secreto es menor, vuelve a intentarlo');
    }
  }

  print('Enhorabuena, has ganado, has usado $numeroIntentos intentos.');
}
