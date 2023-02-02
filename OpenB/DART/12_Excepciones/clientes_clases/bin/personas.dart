import 'direccion.dart';

class Personas<T extends Direccion> {
  String? _nombre;
  int? edad;
  String? telefono;
  T? direccion;

  Personas(this._nombre, {this.edad, this.direccion, this.telefono});

  String? get nombre => this._nombre;

  set nombre(String? value) => this._nombre = value;

  String hablar(String texto) {
    return '$_nombre habla y dice: $texto';
  }

  T? getDireccion() {
    return direccion;
  }
}
