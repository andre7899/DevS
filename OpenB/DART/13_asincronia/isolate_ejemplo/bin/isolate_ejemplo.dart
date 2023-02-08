import 'dart:isolate';

void main(List<String> args) async {
  contarSegundos(4);
  await imprimirDatosUsuario();
}

Future<void> imprimirDatosUsuario() async {
  print('Esperando datos de usuario...');
  try {
    final p = ReceivePort();
    await Isolate.spawn(obtenerDatosUsuario, p.sendPort);
    print(await p.first);
  } catch (e) {
    print(e.toString());
  }
}

//tmb funciona sin async
Future<void> obtenerDatosUsuario(SendPort p) async =>
    Future.delayed(Duration(seconds: 4), (() {
      print('Ya lo he parido desde la isla aislada');
      Isolate.exit(p, 'Ya lo he parido desde la isla principal');
    }));

//------------------
void contarSegundos(int segundos) {
  for (var i = 1; i <= segundos; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}
