abstract class Direccion {
  int? _numeroVia;
  String? _nombreCalle;
  String? _ciudad;

  int? get numeroVia => this._numeroVia;

  set numeroVia(int? value) => this._numeroVia = value;

  get nombreCalle => this._nombreCalle;

  set nombreCalle(value) => this._nombreCalle = value;

  // get codPostal => this._codPostal;

  // set codPostal(value) => this._codPostal = value;

  get ciudad => this._ciudad;

  set ciudad(value) => this._ciudad = value;

  Direccion(this._numeroVia, this._nombreCalle, this._ciudad);
}
