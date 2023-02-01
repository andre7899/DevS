import 'alimento.dart';

void main(List<String> arguments) {
  var uno = [
    'Luis',
    3,
    bool,
    4.5,
    [1, 2, 3],
    {'uno': '1', 'tres': 2}
  ];

  List<String> dos = ['Luis', 'Juan', 'Ana'];
  List<int> tres = [];
  tres
    ..add(1)
    ..add(5);

  Set<String> cuatro = {};
  cuatro
    ..add('a')
    ..add('b')
    ..add('c');

  for (var element in cuatro) {
    print(element);
  }

  Map<String, int> cinco = {'Luis': 1, 'Juan': 100, 'Gema': 1000};

  //Vamos a la compra
  Alimento tomates = Alimento('Tomates', 1.0);
  Alimento champinhon = Alimento('Champinhon', 3.5);

  List<Alimento> listaCompra = [];
  listaCompra
    ..add(tomates)
    ..add(champinhon)
    ..add(Alimento('Peras', 1.2));

  print(listaCompra[2].nombre);
  print(tomates.runtimeType);
}
