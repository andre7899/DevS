import 'trabajador.dart';

final double _valorCambioDolarEuro = 1.11;

//para modificar la clase trabajador sin tocar la clase
//No es una clase, solo extension
extension TrabajadorExtension on Trabajador {
  double convertirADolares(double salario) {
    return salario * 1.11;
  }

  static double obtenerValorCambio() {
    return _valorCambioDolarEuro;
  }
}
