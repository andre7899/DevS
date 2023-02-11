import 'dart:async';

class ControlContador {
  final _streamControl = StreamController<int>();

  int _contador = 2;
  int get contador => this._contador;

  set contador(int value) => this._contador = value;

  Sink<int> get sink => _streamControl.sink;
  Stream<int> get stream => _streamControl.stream;

  void increment() {
    sink.add(++_contador);
  }

  dispose() => _streamControl.close();
}
