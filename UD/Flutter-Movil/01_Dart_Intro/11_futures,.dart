void main() {
  print('Inicio del programa');
  httpGet('http://gg.gg').then((value) {
    print(value);
  }).catchError((error) {
    print('Error $error');
  });
  print('Fin del programa');
}

Future httpGet(String url) {
  return Future.delayed(Duration(seconds: 1), () {
    throw 'Error en la peticion http';
//     return 'Respuesta de la peticion http';
  });
}
