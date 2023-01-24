import 'package:test/test.dart';

void main(List<String> arguments) {
  bool soyAndre = true;

  soyAndre ? print("Correcto") : print("acceso denegado"); //parece un if else

  var a = 10;

  a > 10 ? print("a es mayor que 10") : print("a es menor que 10");

  var b = [1, null, 2];

  b[1] ?? print("b no tiene valor en esa posicion");
}
