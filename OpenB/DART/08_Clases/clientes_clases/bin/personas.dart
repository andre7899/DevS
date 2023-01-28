import 'direccion.dart';

class Persona {
  String? _nombre;
  String? telefono;
  int? edad;
  Direccion? direccion;

  Persona(this._nombre, {this.edad, this.direccion, this.telefono});

  String? get nombre => this._nombre;

  set nombre(String? value) => this._nombre = value;
}
