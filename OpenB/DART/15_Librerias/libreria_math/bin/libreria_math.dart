import 'dart:math';

void main(List<String> arguments) {
  //constantes
  var mPi = pi;
  var raiz2 = sqrt2;

  print(mPi);
  print(raiz2);

  var area1 = 2 * 2 * mPi;
  var area2 = 2 * 2 * 3.1415;

  print(area1);
  print(area2);

  //senos y cosenos

  assert(cos(pi) == -1);
  var grados = 90;
  var radianes = 90 * (pi / 180);

  print(radianes);

  //raiz cuadrada
  var num = 64;
  var raiz = sqrt(num);

  print(raiz);

  //Random
  print(Random().nextInt(100));
  print((Random().nextDouble() * 100).toStringAsFixed(0));
  print(Random().nextBool());

  //point
  var punto1 = Point(0, 0);
  var punto2 = Point(3, 4);

  var distancia = punto1.distanceTo(punto2);
  print(distancia);

  //Rectangule
  var rectangulo = Rectangle(20, 50, 300, 600);
  print(rectangulo.left);

  //max y min
  print(max(2, 4));
  print(max(2, 4));

  //Otros
  //Exponenciales etc
}
