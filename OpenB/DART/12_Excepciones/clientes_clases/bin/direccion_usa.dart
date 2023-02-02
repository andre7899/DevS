import 'direccion.dart';

class DireccinUSA extends Direccion {
  String codPostal;
  String estado;

  DireccinUSA(this.codPostal, this.estado, int numeroVia, String nombreCalle,
      String ciudad)
      : super(numeroVia, nombreCalle, ciudad);
}
