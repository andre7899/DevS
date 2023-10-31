import 'package:flutter/material.dart';
import 'package:test_digitos_wisc/models/sujeto.dart';
import 'package:test_digitos_wisc/models/test_directo.dart';

class CustomTestProvider extends ChangeNotifier {
  bool testStarted = false;
  String numerosEnPantalla = '';

  var numerosOrdenDirecto = TestDirecto.numeroOrdenDirecto;
  Sujeto? sujeto;

  void comenzarTest(String codigo) {
    testStarted = true;
    numerosEnPantalla = numerosOrdenDirecto[0][0].toString();
    sujeto = Sujeto(codigo: codigo);
    notifyListeners();
  }
}
