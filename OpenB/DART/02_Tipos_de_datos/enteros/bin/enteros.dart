void main(List<String> arguments) {
  //==>
  // int uno = 1,dos = 2;

  // int tres;

  // final cuatro = 4;
  // var cinco = 5;
  // dynamic seis = 6;

  // double numeroDouble = 1.7;

  // print(numeroDouble);
  //<==

  functionTest();
}

void functionTest() async {
  final watch = Stopwatch();
  watch.start();
  for (var element in Iterable.generate(
    100000,
    (index) => index,
  )) {
    // if (element % 1000 == 999) {
    //   print('hi: ${element + 1}');
    // }
  }

  watch.stop();
  print('tiempo: ${watch.elapsedMicroseconds / 1000} ms');
}
