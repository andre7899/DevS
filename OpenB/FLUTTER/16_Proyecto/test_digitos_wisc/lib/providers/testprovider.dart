import 'package:flutter/material.dart';
import 'package:test_digitos_wisc/models/sujeto.dart';
import 'package:test_digitos_wisc/models/test_directo.dart';

class CustomTestProvider extends ChangeNotifier {
  bool testStarted = false;
  String numerosEnPantalla = '';

  var numerosOrdenDirecto = TestDirecto.numeroOrdenDirecto;
  Sujeto? sujeto;

  TestDirecto testDirecto = TestDirecto();

  var testActual = Tests.directo;

  void comenzarTest(String codigo) {
    testStarted = true;
    numerosEnPantalla = numerosOrdenDirecto[0][0].toString();
    sujeto = Sujeto(codigo: codigo);
    notifyListeners();
  }

  void correcto() {
    switch (testActual) {
      case Tests.directo:
        correctoTestDirecto();
        break;
      case Tests.inverso:
        break;
      case Tests.creciente:
        break;
      default:
    }
    notifyListeners();
  }

  void incorrecto() {
    switch (testActual) {
      case Tests.directo:
        incorrectoTestDirecto();
        break;
      case Tests.inverso:
        break;
      case Tests.creciente:
        break;
      default:
    }
    notifyListeners();
  }

  void correctoTestDirecto() {
    String resultado = testDirecto.correcto();
    print(resultado);
    if (resultado == 'terminado') {
    } else {
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void incorrectoTestDirecto() {
    String resultado = testDirecto.incorrecto();
    if (resultado == 'terminado') {
      testActual = Tests.inverso;
    } else {
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void pararTest() {
    // sujeto = Sujeto(codigo: codigo);
    // testActual = Tests.directo;
    testStarted = false;
    // numerosEnPantalla = numerosOrdenDirecto[0][0].toString();
    notifyListeners();
  }
}

enum Tests {
  directo,
  inverso,
  creciente,
}
