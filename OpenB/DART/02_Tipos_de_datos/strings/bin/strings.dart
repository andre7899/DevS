
void main(List<String> arguments) {
  String uno = "uno";
  String dos = "dos";
  final multilinea = '''
  Uno
  Dos
  Tres

  ''';

  print(multilinea);

  int cuatro = 4 ;

  String cuatroString = cuatro.toString();

  
  // print(cuatro.runtimeType);
  // print(cuatroString.runtimeType);
  // print(cuatroString);

  double peso = 60.235;
  String pesoString = peso.toStringAsFixed(2);

  String refran = "en abril aguas mil";

  // print(refran.contains("agua2"));

  String email = "contacto@uni.pe";

  // print("El dominio de la dirección es: ${email.split("@")[1]}"); //separar de acuerdo al separador introducido y devuelve lista

  // print(refran.startsWith("mil"));

  // print(refran.endsWith("mil"));

  // print(email.indexOf("@"));

  print(email.substring(8+1,email.indexOf(".")));// extrae desde posicion 8+1 hasta indice del . (el ultimo no se toma en cuenta)


}
