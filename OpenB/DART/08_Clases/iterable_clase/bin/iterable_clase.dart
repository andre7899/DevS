void main(List<String> arguments) {
  Iterable<int> iterable = [1, 2, 3];
  List<int> listaEnteros = [1, 2, 3];

  listaEnteros[1];
  iterable.elementAt(1);

  Iterable<String> alimentos = ['Tomate', 'carne', 'lechuga'];
  for (var alimento in alimentos) {
    print(alimento);
  }

  print('El primer alimento es ${alimentos.first}');
  print('El ultimo alimento es ${alimentos.last}');

  var elementoEncontrado1 = alimentos.firstWhere(
      (element) => element.startsWith('c'),
      orElse: () => 'No lo hay');

  print(elementoEncontrado1);

  var elementoEncontrado2 =
      alimentos.firstWhere((element) => element.startsWith('c'));
  print(elementoEncontrado2);

  var elementoEncontrado3 = alimentos.firstWhere(
      (element) => element.startsWith('w'),
      orElse: () => 'No lo hay'); //la misma funcion de nuevo
  print(elementoEncontrado3);

  var elementosSingle = alimentos.singleWhere(
      (element) => element.contains('g') && element.startsWith('l'));

  print(elementosSingle);

  // for (var alimento in alimentos) {
  //   if (alimento.length > 10) {
  //     print('Lista de palabras cortas no valida');
  //   }
  // }

  //Si todoss cumplen...
  var variableEvery = alimentos.every((element) => element.length > 1);
  print(variableEvery);

  //Que si alguno lo cumple...
  var variableAny = alimentos.any((element) => element.length > 6);
  print(variableAny);

  Iterable<User> users = [User(12, 'Luis'), User(19, 'Gema')];
  var todoMayores13 = users.every((user) => user.edad > 13);
  todoMayores13
      ? print('Todos mayores que 13')
      : print('No son mayores que 13');

  var mayor18 = users.any((element) => element.edad > 18);
  mayor18 ? print('Alguno es mayor que 18') : print('Ninguno es mayor que 18');
}

class User {
  var edad;
  var name;

  User(this.edad, this.name);
}
