class Profesion {
  String? profesion;

  String competencias(List competencias) {
    StringBuffer stringBuffer = StringBuffer();

    // añadimos string al existente
    stringBuffer.write('La $profesion tiene las siguientes competencias:\n');

    for (var competencia in competencias) {
      stringBuffer.writeln('- $competencia');
    }

    return stringBuffer.toString();
  }
}
