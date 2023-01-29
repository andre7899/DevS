void main(List<String> arguments) {
  var cafe = Cafe();

  print('Orden Recibida');

  cafe.calentar();
  cafe.enfriar();
  print(cafe.servir());

  // cafe.calentar();
  // print('Hola, ${cafe.servir()}');
  // print('Orden Recibida');
  print('el cafe está ${cafe._temperatura}');
  // print('cafe entregado');
}

class Cafe {
  // late String _temperatura =
  //     prepararCafe();
  late final _temperatura; // que evalue si es nula cuando se haga la ejecucion

  void calentar() {
    _temperatura = 'caliente';
  }

  void enfriar() {
    _temperatura = 'frío';
  }

  String prepararCafe() {
    print('Preparando...');
    return 'caliente';
  }

  String servir() => 'Aqupi tiene su café $_temperatura';
}

//IMPORTANTE
//las variables privadas son mas a nivel de librerias
