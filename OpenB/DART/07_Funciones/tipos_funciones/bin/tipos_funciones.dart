void main(List<String> arguments) {
  // imprimirHolaMundo();
  // imprimirHolaMundo();
  var miEdad = devuelemeTuEdad();
  print(miEdad);
  // amor();

  double area = areaRectangulo(2.3, 8);
  print('El are es $area');
  print(
      'El are es ${areaRectangulo(2.3, 8)}, este calculo se hace desde el print');

  // String sentimiento = amor();
  // print('¿Qué es lo que yo siento por ti? $sentimiento ');
  var miSentimientoPuro = amor('María');
  print(miSentimientoPuro);
}

void imprimirHolaMundo() {
  print('Hola mundo');
}

String amor(String tuNombre) {
  String resultado = 'Te quiero ${tuNombre.toUpperCase()}';
  return resultado;
}

int devuelemeTuEdad() {
  int edad = 23;
  return edad;
}

double areaRectangulo(double a, double b) {
  double area = a * b;
  return area;
}
