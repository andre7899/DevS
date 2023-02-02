import 'direccion.dart';
import 'direccion_es.dart';
import 'direccion_usa.dart';
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
}
