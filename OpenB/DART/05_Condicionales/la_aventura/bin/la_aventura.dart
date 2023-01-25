import 'dart:io';

void main(List<String> arguments) {
  print('Hola como te llamas');
  String nombreJugador = stdin.readLineSync()!;

  print('Hola $nombreJugador.');
  print(
      'Vas andando por una carretera y esta llega a su fin, tienes dos opciones, ir a la derecha o a la izquierda');

  print('que direccion escoges');

  String direccion = stdin.readLineSync()!;

  if (direccion == 'derecha') {
    print(
        'Te encuentras un río y puedes elegir si cruzar nadando o andar hasta encontrar un puente.' +
            'Introduce andar para andar y nadar para nadar ');

    String opcion = stdin.readLineSync()!;
    if (opcion == 'nadar') {
      print(
          'Mientras nadabas, apareció un cocodrilo que te comió en menos que canta un gallo');
    } else if (opcion == 'andar') {
      print(
          'Anduviste durante muchos días y te quedaste sin comida, finalmente tu cuerpo se desvaneció');
    } else {
      print('Esa no era una opción válida, has perdido');
    }
  } else if (direccion == 'izquierda') {
    print('Tras un paseo, te encuentras un puente, ¿Qué quieres hacer?' +
        'Introduce cruzarlo para cruzarlo o dar la vuelta para dar la vuelta');
    String opcion = stdin.readLineSync()!;

    if (opcion == 'dar la vuelta') {
      print(
          'Das la vuelta y eliges ahora el camino de la derecha, llegas a un río' +
              'y da igual lo que elijas porque vas a morir igual');
    } else if (opcion == 'cruzarlo') {
      print('Te encuentras a un extraño, ¿Quieres hablar con él? Si o no: ');
      String opcion2 = stdin.readLineSync()!;
      if (opcion2 == 'no') {
        print('Ese señor estaba regalando oro y no lo has conseguido, pierdes');
      } else if (opcion2 == 'si') {
        print('El hombre decide regalarte el oro, HAS GANADO!!!');
      }
    } else {
      print('Esa no era una opcion válida');
    }
  } else {
    print('Esa no era una opción valida');
  }
}
