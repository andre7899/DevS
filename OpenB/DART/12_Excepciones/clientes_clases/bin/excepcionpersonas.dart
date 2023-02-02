class ExcepcionPersonas implements FormatException {
  int _source;
  ExcepcionPersonas(this._source);

  @override
  String get message => 'El codigo postal debe tener 5 caracteres';

  @override
  int get offset => 5 - _source;

  @override
  int get source => _source;
}
