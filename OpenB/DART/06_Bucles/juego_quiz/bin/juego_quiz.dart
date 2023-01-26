import 'dart:io';

void main(List<String> arguments) {
  print('¿Quieres jugar un juego?: ');

  String quiereJugar = stdin.readLineSync()!;

  if (quiereJugar != 'si') {
    exit(0);
  }

  print('Juguemos :D');
  var puntuacion = 0;
}
