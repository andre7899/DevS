import 'package:test/test.dart';

import 'direccion.dart';
import 'excepcionpersonas.dart';

class DireccionEs extends Direccion {
  String? _cod_postal;

  DireccionEs(
      String codPostal, int numeroVia, String nombreCalle, String ciudad)
      : super(numeroVia, nombreCalle, ciudad) {
    cod_postal = codPostal; // llamamos al metodo set
  }

  String? get cod_postal => _cod_postal;

  set cod_postal(String? value) {
    if (value!.length == 5) {
      _cod_postal = value;
    } else {
      throw ExcepcionPersonas(value.length);
    }
  }
}
