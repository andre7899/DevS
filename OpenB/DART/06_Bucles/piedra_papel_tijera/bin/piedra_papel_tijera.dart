import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  // ignore: unused_local_variable
  var userWins = 0, computerWins = 0;
  var opciones = ['piedra', 'papel', 'tijera'];

  while (true) {
    print('Elige piedra, papel o tijera o introduce \'q\' para salir');
    var eleccionUsuario = stdin.readLineSync()!.toLowerCase();

    if (eleccionUsuario == 'q') {
      break;
    }

    if (!opciones.contains(eleccionUsuario)) {
      print('Elige piedra, papel o tijera');
      continue;
    }

    Random random = Random();
    var randomNum = random.nextInt(3);
    var eleccionOrdenador = opciones[randomNum];

    print('El ordenador ha elegido $eleccionOrdenador');

    if (eleccionUsuario == eleccionOrdenador) {
      print('Hubo un empate');
    } else if (eleccionUsuario == 'piedra' && eleccionOrdenador == 'tijera') {
      print('Has ganado');
      userWins++;
    } else if (eleccionUsuario == 'papel' && eleccionOrdenador == 'piedra') {
      print('Has ganado');
      userWins++;
    } else if (eleccionUsuario == 'tijera' && eleccionOrdenador == 'papel') {
      print('Has ganado');
      userWins++;
    } else {
      print('Has perdido!');
      computerWins++;
    }
  }

  print('\nTus puntos: $userWins');
  print('Puntos del ordenador: $computerWins');
  if (computerWins > userWins) {
    print('Ha ganado la maquina');
  } else if (computerWins == userWins) {
    print('Empate!');
  } else {
    print('Has ganado');
  }
}
