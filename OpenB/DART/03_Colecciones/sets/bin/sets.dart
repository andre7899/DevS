void main(List<String> arguments) {
  var miPrimerSet = <String>{
    "Andre",
    "Luis",
    "Juan"
  }; //Solo es para un mismo tipo
  print(miPrimerSet);

  miPrimerSet.add("maria");
  print(miPrimerSet);

  print(miPrimerSet.elementAt(2));
  print(miPrimerSet.length);

  miPrimerSet.remove("maria"); //devuelve true si encuentra el elemento
  print(miPrimerSet);

  miPrimerSet.clear();
  print(miPrimerSet);
}
