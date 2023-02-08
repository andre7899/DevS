import 'dart:async';

Future<void> main(List<String> arguments) async {
  print('Obteniendo datos de usuario...');
  print(await crearLlamada());
  // Timer(Duration(seconds: 2), () => print('Ya lo he parido con timer'));
}

Future<String> crearLlamada() {
  var datos = obtenerDatosUsuario();
  return datos;
}

//cualquier funcion future es asincrona
Future<String> obtenerDatosUsuario() =>
    Future.delayed(Duration(seconds: 3), () => 'Ya lo he parido');

  //Future<List<String>>
