void main(List<String> arguments) {
  print('El resultado es: ${factorial(5)}');
  print('El resultado es: ${factorialBasura(5)}');
}

//la recursividad consume memoria, usarla cuando sea realmente necesaria
int factorial(int num) {
  if (num == 1) {
    return 1;
  }
  return num * factorial(num - 1);
}

int factorialBasura(int num) {
  var resultado = 1;
  if (num == 1 || num == 0) {
    return 0;
  }
  while (num > 1) {
    resultado *= num;
    num--;
  }
  return resultado;
}
