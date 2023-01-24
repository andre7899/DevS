

void main(List<String> arguments) {
  String cienString = "100";

  int cien = int.parse(cienString);

  int doscientos = 200;
  int suma = cien + doscientos;

  print("la suma es: " + suma.toString());
  print("La suma de $cien y $doscientos es $suma");

  String a = "uno ";
  String b = "dos ";
  print(a+b);

  double numeroDecimales = 100.564;
  String doubleString = numeroDecimales.toStringAsFixed(3);
  print("El numero double en String es: " + doubleString);

  var miSet = <int>{doscientos, int.parse(cienString)};
  print(miSet);
}
