import 'dart:io';

void main(List<String> arguments) {
  // int edad = 'Feliz cumpleaños';

  //Si queremos que una variable puede ser nula: '?'
  // int? numero;
  // openSocket(numero);

  String apellido = obtenerApellido('Luis garcia');
  print(apellido);

  int? variableConQuizasValor;
  //El operador assert '!' es como si aseguraramos que no será nulo(bajo nuestro riesgo)
  int valor = variableConQuizasValor!; //Esto genera error si lo dejamos asi
}

openSocket(int? port) {
  if (port == null) {
    return print('Es nulo');
  }
}

String obtenerApellido(String nombreCompleto) {
  var partes = nombreCompleto.split(' ');

  var apellido = partes.length > 1 ? partes[1] : null;

  if (apellido == null) {
    exit(0); //acaba el programa
  }
  return apellido;
}
