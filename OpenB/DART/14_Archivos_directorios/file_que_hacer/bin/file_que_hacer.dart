import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  final file =
      File('C:/DevS/OpenB/DART/14_Archivos_directorios/salida_elastic.txt');
  String? lineaParaEscribir;

  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());

  try {
    await for (var line in lines) {
      print('${line.length}: $line');
      lineaParaEscribir = line;
    }
    print('El archivo ha sido cerrado');
  } catch (e) {
    print(e.toString());
  }

  //Vamos a escribir
  String path =
      'C:/DevS/OpenB/DART/14_Archivos_directorios/salida_elastic2.txt';

  var fileEscribir =
      await File(path).writeAsString(lineaParaEscribir!.toUpperCase());

  String path2 =
      'C:/DevS/OpenB/DART/14_Archivos_directorios/salida_elastic3.txt';
  var fileEscribir2 = File(path2);
  var openWrite = fileEscribir2.openWrite();
  openWrite.writeln(lineaParaEscribir);
  openWrite.writeln('segunda linea');
  openWrite.close();

  //borrar archivo
  fileEscribir.delete(); //borramos el archivo 2
}
