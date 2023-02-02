import 'personas.dart';
import 'paseante.dart';

class Trabajador extends Personas implements Paseante {
  double salario;

  Trabajador(String nombre, this.salario) : super(nombre);
  // Trabajador(super._nombre, this.salario);

  // @override
  String hablar(String texto) {
    return super.hablar(texto) + ', Se trata de un empleado';
  }

  //la interfaz me obliga a definir los metodos
  //el uso de override se usa más como documentaicon y buena practica
  @override //esta sobreescribiendo lo que ya teniamos
  void caminar() {
    print('Camino como un trabajador');
  }
}
