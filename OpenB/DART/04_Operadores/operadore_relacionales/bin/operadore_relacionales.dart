void main(List<String> arguments) {
  int a = 10;
  int b = 25;
  int c = 10;

  var mayor = a > b;
  var menor = a < b;
  var mayorIgual = a >= b;
  var menorIgual = b <= a;
  var mayorIgual2 = a >= c;
  var menorIgual2 = b <= c;

  print(mayor);
  print(menor);
  print(mayorIgual);
  print(menorIgual);
  print(mayorIgual2);
  print(menorIgual2);
  print("");

  var igual = a == b;
  var diferente = a != b;

  print(igual);
  print(diferente);
}
