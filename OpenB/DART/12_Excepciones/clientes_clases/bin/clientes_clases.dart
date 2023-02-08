import 'direccion.dart';
import 'direccion_es.dart';
import 'direccion_usa.dart';
import 'excepcionpersonas.dart';
import 'personas.dart';
import 'profesion.dart';
import 'trabajador.dart';
import 'trabajadorextension.dart';
import 'usuarios.dart';

void main(List<String> args) {
  //Clase generalidades

  DireccionEs direccionEs = DireccionEs('23009', 1, 'Esperanza', 'Jaen');
  DireccinUSA direccinUSA = DireccinUSA('31101', 'FL', 1, 'Esperanza', 'Miami');

  Personas<DireccionEs> luis = Personas('Luis', direccion: direccionEs);
  Personas<DireccinUSA> paul = Personas('Paul', direccion: direccinUSA);
  print(luis.direccion!
      .cod_postal); //esto no se podria si no especificamos el tipo de clase

  // Personas<String> personaString = Personas('String');
  // Personas<DireccinUSA> mary = Personas('Paul', direccion: direccionEs);
  Personas<DireccinUSA> mary = Personas('Paul', direccion: direccinUSA);

  print(luis.direccion!.cod_postal);

  print(luis.direccion.runtimeType);
  print(paul.direccion.runtimeType);

  //Excepcion personalizada

  try {
    DireccionEs direccionConError = DireccionEs('111', 1, 'Jaen', 'Jaen');
  } on ExcepcionPersonas catch (e) {
    String message = e.message;
    int offset = e.offset;
    int source = e.source;
    print(
        '$message. El valor introducido tiene $source. Faltan $offset caracteres,');
  }
  //eL codigo siempre continua si captura la excepcion
  print('El programa continua');

  //Si dentro del cath hay otra excepcion, el finally si se ejecutara pero no el resto del programa
}
