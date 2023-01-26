import 'dart:async';
import 'dart:io';

void main(List<String> arguments) {
  print('¿Quieres jugar un juego?: ');

  String quiereJugar = stdin.readLineSync()!;

  if (quiereJugar != 'si') {
    exit(0);
  }

  print('Juguemos :D');
  var puntuacion = 0;

  print('¿Que Significa las siglas CPU?');
  var respuesta = stdin.readLineSync();

  if (respuesta!.toLowerCase() == 'control process unit') {
    print('Correcto!');
    puntuacion++;
  } else {
    print('Incorrecto!');
  }

  print('¿Que Significa las siglas RAM?');
  respuesta = stdin.readLineSync();

  if (respuesta!.toLowerCase() == 'random access memory') {
    print('Correcto!');
    puntuacion++;
  } else {
    print('Incorrecto!');
  }

  print('¿Que Significa las siglas PSU?');
  respuesta = stdin.readLineSync();

  if (respuesta!.toLowerCase() == 'power supply') {
    print('Correcto!');
    puntuacion++;
  } else {
    print('Incorrecto!');
  }

  print('Has obtenido $puntuacion respuestas correctas.');
  print('Tu puntuacion es de ${puntuacion / 3 * 100}%');
}
