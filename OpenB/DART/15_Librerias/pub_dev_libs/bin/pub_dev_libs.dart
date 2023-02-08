import 'dart:io';

import 'package:english_words/english_words.dart';
import 'package:csv/csv.dart';

void main(List<String> arguments) {
  nouns.take(50).forEach(print);

  print(syllables('snake'));
  print(syllables('boy'));

  generateWordPairs().take(5).forEach(print);

  List<List<dynamic>> listaEjemplo = [];

  for (var i = 0; i < 10; i++) {
    listaEjemplo.add([]);
    for (var t = 0; t < 10; t++) {
      if (i == 0) {
        listaEjemplo[i].add('Columna ${t + 1}');
      } else {
        listaEjemplo[i].add(t + 1);
      }
    }
  }

  String csv = const ListToCsvConverter().convert(listaEjemplo);

  Directory directory =
      Directory('C:/DevS/OpenB/DART/15_Librerias/pub_dev_libs');
  final path = directory.path + '/miCSV.csv';
  File file = File(path);
  file.writeAsString(csv);
}
