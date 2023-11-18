void main() async {
  print('Inicio del programa');

  try {
    final value = await httpGet('http://gg.com');
    print('exito: $value');
  } on Exception catch (err) {
    print('Tenemos una excepcion!: $err');
  } catch (err) {
    print('Tenemos un error: $err');
  } finally {
    print('Fin de try catch');
  }

  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(Duration(seconds: 1), () {});
//   throw Exception('no hay parametros en URL');
  throw 'Erroe en peticion';
//   return 'Tenemos un valor de la peticion';
}
