void main(List<String> arguments) {
  var listaNombres = ['Andre', 'Maria', 'Juan'];

  listaNombres.forEach((element) {
    //funcion anonima
    // es parecido a un for in
    print(element);
  });
  var elemento;
  for (elemento = 0; elemento < listaNombres.length; elemento++) {
    print(listaNombres[elemento]);
  }
}
