import 'direccion.dart';

class Personas {
  String? _nombre;
  int? edad;
  String? telefono;
  Direccion? direccion;

  Personas(this._nombre, {this.edad, this.direccion, this.telefono});

  String? get nombre => this._nombre;

  set nombre(String? value) => this._nombre = value;

  String hablar(String texto) {
    return '$_nombre habla y dice: $texto';
  }
}
