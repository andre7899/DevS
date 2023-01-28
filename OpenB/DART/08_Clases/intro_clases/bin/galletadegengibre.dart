class GalletaDeJengibre {
  //atributos publicos y edad privado
  String? nombre;
  String? tipo;
  // _edad es privado
  var _edad;
  bool? sabeDarVolteretas;

  String? get getNombre => this.nombre;

  set setNombre(String? nombre) => this.nombre = nombre;

  get getTipo => this.tipo;

  set setTipo(tipo) => this.tipo = tipo;

  get edad => this._edad; //los privados colo directamente el nombre sin get

  set edad(value) => this._edad = value;

  get getSabeDarVolteretas => this.sabeDarVolteretas;

  set setSabeDarVolteretas(sabeDarVolteretas) =>
      this.sabeDarVolteretas = sabeDarVolteretas;

  GalletaDeJengibre(this.nombre, this._edad);

  GalletaDeJengibre.semiAvanzada(this.nombre, this._edad, {this.tipo});

  GalletaDeJengibre.avanzada(this.nombre, this._edad,
      {this.tipo, this.sabeDarVolteretas});

  GalletaDeJengibre.sinDatos(this._edad,
      {this.nombre, this.tipo, this.sabeDarVolteretas});

  // GalletaDeJengibre(String nombreEntrada, edadEntrada) {
  //   nombre = nombreEntrada;
  //   this._edad = edadEntrada; //se usa this para diferenciar los nombres
  // }

  // set setEdad(int edad) {
  //   _edad = edad;
  // }

  // int getEdad() => _edad;

  // get getEdad {
  //   return _edad;
  // }

  nacer() {
    print('Estoy vivo?');
  }

  void dormir() {
    print('ZZzzZzzz');
  }

  bool aprenderVoltereta() {
    if (_edad > 20) {
      sabeDarVolteretas = true;
      return true;
    }
    return false;
  }
}
