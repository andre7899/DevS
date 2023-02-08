import 'dart:async';

void main(List<String> arguments) {
  obtenerDatosUsuario();
  Timer(Duration(seconds: 2), () => print('Ya lo he parido con timer'));
  print('Obteniendo datos de usuario...');
}

// String crearLlamada() {
//   var datos = obtenerDatosUsuario();
//   return datos.toString();
// }

//cualquier funcion future es asincrona
Future<void> obtenerDatosUsuario() => Future.delayed(
    Duration(seconds: 3), () => throw Exception('Id de usuario no encontrado'));

  //Future<List<String>>
