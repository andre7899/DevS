import 'direccion.dart';

class DireccionEs extends Direccion {
  String cod_postal;
  DireccionEs(this.cod_postal, int numeroVia, String nombreCalle, String ciudad)
      : super(numeroVia, nombreCalle, ciudad);
}
