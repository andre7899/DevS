void main(List<String> arguments) {
  int a = 10;
  int b = 25;

  //suma
  print(a + b);

  //resta
  print(a - b);

  //multiplicacion
  print(a * b);

  //division
  print(a / b);
  var division = b / a;
  print(division.runtimeType);

  //incremento y decremento
  print(a);
  a++;
  print(a);
  a--;
  print(a);

  //division entera
  print(b ~/ a);

  //resto de una division
  print(b % a);

  //cambiod de signo
  print(-a);
}
