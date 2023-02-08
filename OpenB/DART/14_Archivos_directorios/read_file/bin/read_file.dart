import 'dart:io';

void main(List<String> arguments) async {
  var dir = Directory('C:/DevS/OpenB/DART');

  //comprobar que esxiste un directorio
  var existe = await dir.exists();
  print(existe ? 'Existe' : 'No existe');

  //Listar todos los elementos de un directorio temporal
  // var tempDir = Directory.systemTemp;

  // await for (var directorio
  //     in tempDir.list(recursive: false, followLinks: false)) {
  //   print(directorio);
  // }

  //Crear carpeta
  var carpetaACrear =
      Directory('C:/DevS/OpenB/DART/14_Archivos_directorios/read_file/Prueba')
          .create();

  //Lista de todos los elementos de cualquier carpetea
  var directorioAListar =
      Directory('/DevS/OpenB/DART/14_Archivos_directorios/read_file');
  List<FileSystemEntity> listaArchivos =
      await directorioAListar.list().toList();
  print(listaArchivos);

  //Borrar carpeta
  Directory('C:/DevS/OpenB/DART/14_Archivos_directorios/read_file/Prueba')
      .delete();
}
