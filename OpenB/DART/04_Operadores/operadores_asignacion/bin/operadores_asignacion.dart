void main(List<String> arguments) {
  int a = 10;
  int b = 25;
  var c;

  c ??= 1; //Si la variable c era nula, le asignamos el valor a
  print(c);

  c += a;
  print(c);

  c -= a;
  print(c);

  c *= a;
  print(c);

  c /= a;
  print(c);
}
