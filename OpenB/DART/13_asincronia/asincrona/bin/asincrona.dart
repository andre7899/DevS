import 'dart:async';

void main(List<String> arguments) {
  int contador = 5;
  Timer(Duration(seconds: 2), (() => print('Me ejecuto a los 2 segundos')));

  Timer.periodic(Duration(seconds: 2), (timer) {
    // print('Me ejecuto a los 3 segundos siempre');
    contador--;
    if (contador == 0) {
      timer.cancel();
    }
    print(DateTime.now());
  });

  print('Yo me ejecuto antes');
}
