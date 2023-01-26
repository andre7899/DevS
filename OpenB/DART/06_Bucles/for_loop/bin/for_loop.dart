void main(List<String> arguments) {
  var iteraciones = 10;

  //cuenta hacie arriba
  for (var i = 0; i < iteraciones; i++) {
    print(i);
  }

  //cuenta hacia abajo
  for (var i = 0; i < iteraciones; i++) {
    print(iteraciones - i);
  }

  //otra forma
  for (var i = 10; i >= 0; i--) {
    print(i);
  }

  var lista = ['luis', 'Juan', 'Carmen'];

  for (var i = 0; i < lista.length; i++) {
    print('Feliz navidad ${lista[i]}!!');
  }
  print('');
  var ix = 0;
  for (var element in lista) {
    print('Feliz navidad $element');
  }
}
