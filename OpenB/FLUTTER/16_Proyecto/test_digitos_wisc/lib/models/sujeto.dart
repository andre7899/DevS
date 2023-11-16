class Sujeto {
  final String _codigo;
  String fecha = '';

  int _puntuacionDirecta = 0;
  int _puntuacionDirectaSpan = 0;
  int _puntuacionInverso = 0;
  int _puntuacionInversoSpan = 0;
  int _puntuacionCreciente = 0;
  int _puntuacionCrecienteSpan = 0;

  get codigo => _codigo;

  get getFecha => fecha;

  set setFecha(fecha) => this.fecha = fecha;

  get puntuacionDirecta => _puntuacionDirecta;

  set puntuacionDirecta(value) => _puntuacionDirecta = value;

  get puntuacionDirectaSpan => _puntuacionDirectaSpan;

  set puntuacionDirectaSpan(value) => _puntuacionDirectaSpan = value;

  get puntuacionInverso => _puntuacionInverso;

  set puntuacionInverso(value) => _puntuacionInverso = value;

  get puntuacionInversoSpan => _puntuacionInversoSpan;

  set puntuacionInversoSpan(value) => _puntuacionInversoSpan = value;

  get puntuacionCreciente => _puntuacionCreciente;

  set puntuacionCreciente(value) => _puntuacionCreciente = value;

  get puntuacionCrecienteSpan => _puntuacionCrecienteSpan;

  set puntuacionCrecienteSpan(value) => _puntuacionCrecienteSpan = value;

  Sujeto({
    required codigo,
  }) : _codigo = codigo;
}
