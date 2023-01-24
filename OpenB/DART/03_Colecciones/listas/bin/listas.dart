import 'dart:math';

void main(List<String> arguments) {
  var miPrimeraLista = [10, 14];
  var miSegundaLista = ["andre", "Luis", "Antonio"];

  //lista formada por varias listas
  var listaDeListas = [
    [10, 14],
    miSegundaLista,
    [12.5, 16, 3]
  ];

  var miNombre = miSegundaLista[0];
  print(miNombre);

  var tamanho = listaDeListas.length;
  print(tamanho);

  var accediendo = listaDeListas[0][0];
  print(accediendo);

  var listaFija = List.filled(4,"",growable: false);
  listaFija[0] = "luis";
  listaFija[1] = miSegundaLista[1];
  print(listaFija);

  // listaFija.add("hola"); con growable false impide que crezca
  miSegundaLista.add("hola");
  print(miSegundaLista);
  print(miSegundaLista.length);

  print(miSegundaLista.last);
  print(miSegundaLista[miSegundaLista.length-1]);

  print(miSegundaLista.reversed.runtimeType);

  //cualquiera -> objeto, tipo especifico -> tipo especifico
  var lista = ["asd", "asd", "15"];
  print(lista.runtimeType);
  lista[0] = miSegundaLista[1];
  print(lista.runtimeType);
  print(lista);
}
