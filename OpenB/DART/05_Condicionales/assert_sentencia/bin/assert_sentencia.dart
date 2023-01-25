import 'package:test/test.dart';

void main(List<String> arguments) {
  print('Inicio del programa');
  int edad = 20;
  assert(true,
      'Hay fallo en la terera linea'); //se usa mas para desarrollo que para produccion
  assert(edad < 20, 'La edad es $edad');
  if (edad > 20) {
    print('Aun no es tarde para programaar en DArt');
  }

  print('Fin del Programa');
}
