import 'package:flutter/material.dart';
import 'package:test_digitos_wisc/models/sujeto.dart';
import 'package:test_digitos_wisc/models/test_creciente.dart';
import 'package:test_digitos_wisc/models/test_directo.dart';
import 'package:test_digitos_wisc/models/test_inverso.dart';

class CustomTestProvider extends ChangeNotifier {
  bool testStarted = false;
  bool testTerminado = false;
  String numerosEnPantalla = '';
  bool pruebaTest = false;

  Sujeto? sujeto;

  TestDirecto testDirecto = TestDirecto();
  var numerosOrdenDirecto = TestDirecto.numeroOrdenDirecto;

  TestInverso testInverso = TestInverso();
  var numerosOrdenInverso = TestInverso.numeroOrdenInverso;

  TestCreciente testCreciente = TestCreciente();
  var numerosCreciente = TestCreciente.numerordenCreciente;

  var testActual = Tests.directo;

  String testActualString = '';

  void comenzarTest(String codigo) {
    cambiarStringTestActual(testActual);
    testTerminado = false;
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
        correctoTestCreciente();
        break;
      case Tests.creciente:
        correctoTestCreciente();
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
        incorrectoTestInverso();
        break;
      case Tests.creciente:
        incorrectoTestCreciente();
        break;
      default:
    }
    notifyListeners();
  }

  void correctoTestDirecto() {
    String resultado = testDirecto.correcto();
    print(resultado);
    if (resultado == 'terminado') {
      comenzarTestInverso();
    } else {
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void incorrectoTestDirecto() {
    String resultado = testDirecto.incorrecto();
    if (resultado == 'terminado') {
      // testActual = Tests.inverso;
      comenzarTestInverso();
    } else {
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void pararTest() {
    // sujeto = Sujeto(codigo: codigo);
    // testActual = Tests.directo;
    testStarted = false;
    testDirecto = TestDirecto();
    testInverso = TestInverso();
    testCreciente = TestCreciente();

    // numerosEnPantalla = numerosOrdenDirecto[0][0].toString();
    notifyListeners();
  }

  void finalizarTest() {
    testStarted = false;
    testTerminado = true;
    sujeto!.puntuacionDirecta = testDirecto.aciertos;
    sujeto!.puntuacionDirectaSpan = testDirecto.span;
    sujeto!.puntuacionInverso = testInverso.aciertos;
    sujeto!.puntuacionInversoSpan = testInverso.span;
    sujeto!.puntuacionCreciente = testCreciente.aciertos;
    sujeto!.puntuacionCrecienteSpan = testCreciente.span;
    notifyListeners();
  }

//------------------------------------------------------------------
  void comenzarTestInverso() {
    testActual = Tests.inverso;
    cambiarStringTestActual(testActual);

    pruebaTest = true;

    numerosEnPantalla = numerosOrdenInverso[0][0].toString();
    notifyListeners();
  }

  void correctoTestInverso() {
    String resultado = testInverso.correcto();
    print(resultado);
    if (resultado == 'terminado') {
      comenzarTestCreciente();
    } else {
      if (testInverso.contEjemplo == 2) {
        pruebaTest = false;
      } else {
        pruebaTest = true;
      }
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void incorrectoTestInverso() {
    String resultado = testInverso.incorrecto();
    if (resultado == 'terminado') {
      // testActual = Tests.inverso;
      comenzarTestCreciente();
    } else {
      if (testInverso.contEjemplo == 2) {
        pruebaTest = false;
      } else {
        pruebaTest = true;
      }
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  //----------------------------------------------------
  void comenzarTestCreciente() {
    testActual = Tests.creciente;
    cambiarStringTestActual(testActual);
    pruebaTest = true;

    numerosEnPantalla = numerosCreciente[0][0].toString();
    notifyListeners();
  }

  void correctoTestCreciente() {
    String resultado = testCreciente.correcto();
    print(resultado);
    if (resultado == 'terminado') {
      finalizarTest();
    } else {
      if (testCreciente.contEjemplo == 4) {
        pruebaTest = false;
      } else {
        pruebaTest = true;
      }
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void incorrectoTestCreciente() {
    String resultado = testCreciente.incorrecto();
    if (resultado == 'terminado') {
      // testActual = Tests.inverso;
      finalizarTest();
    } else {
      if (testCreciente.contEjemplo == 4) {
        pruebaTest = false;
      } else {
        pruebaTest = true;
      }
      numerosEnPantalla = resultado;
      notifyListeners();
    }
  }

  void cambiarStringTestActual(Tests tests) {
    switch (tests) {
      case Tests.directo:
        testActualString = 'Test Directo';
        break;
      case Tests.inverso:
        testActualString = 'Test Inverso';
        break;
      case Tests.creciente:
        testActualString = 'Test Creciente';
        break;
      default:
    }
    notifyListeners();
  }
}

enum Tests {
  directo,
  inverso,
  creciente,
}
