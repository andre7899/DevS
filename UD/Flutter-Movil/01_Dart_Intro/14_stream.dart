void main() {
  emitNimbers().listen((value) {
    print('Stream value: $value');
  });
}

Stream<int> emitNimbers() {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    print('desde periodic $value');
    return value;
  }).take(5);
}
