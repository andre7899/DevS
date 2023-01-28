void main(List<String> arguments) {
  final ahora = DateTime.now(); //hora de la pc
  print(ahora);
  final aterrizaLuna = DateTime(1969, 7, 20, 20, 0, 0);
  final caidaMuroBerlin = DateTime(1969, 11, 9);

  final aterrizajeLuna2 = DateTime.parse('1969-07-20 20:18:04Z');

  print(aterrizaLuna.day);
  print(aterrizaLuna.month);
  print(aterrizaLuna.year);

  final nacimientoLuis = DateTime.parse('1992-11-16');
  nacimientoLuis.weekday == DateTime.monday
      ? print('Luis nacio lunes')
      : print('No se cuando nacio');

  print(nacimientoLuis.isUtc);
  print(ahora.isUtc);

  final nacimientoLuis2 = DateTime.utc(1992, 11, 16);
  print(nacimientoLuis2.isUtc);

  print(nacimientoLuis);
  print(nacimientoLuis.toUtc());

  print(nacimientoLuis.timeZoneName);
  print(nacimientoLuis.timeZoneOffset);

  print(aterrizaLuna.isBefore(nacimientoLuis));

  var diferenciaLunaLuis = nacimientoLuis.difference(aterrizaLuna);
  print(diferenciaLunaLuis.inDays / 365.25);
}
