void main(List<String> args) async {
  contarSegundos(4);
  await imprimirDatosUsuario();
}

Future<void> imprimirDatosUsuario() async {
  print('Esperando datos de usuario...');
  try {
    var datos = await obtenerDatosUsuario();
    print(datos);
  } catch (e) {
    print(e.toString());
  }
}

Future<String> obtenerDatosUsuario() => Future.delayed(
    Duration(seconds: 4), () => throw Exception('Error en ID de usuario'));

//------------------
void contarSegundos(int segundos) {
  for (var i = 1; i <= segundos; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}
