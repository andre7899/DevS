void main() async {
  print('Inicio del programa');
  try {
    final value = await httpGet('http://gg.com');
    print(value);
  } catch (err) {
    print('Tenemos un error: $err');
  }
  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(Duration(seconds: 1), () {});
  throw 'Erroe en peticion';
//   return 'Tenemos un valor de la peticion';
}
