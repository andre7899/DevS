void main(List<String> arguments) {
  var nombre = "Andre";
  var edad = 23;
  var primerApellido = "Amaya";
  // print("Mi nombre es: " + nombre); Recomienda interpolacion
  print("Mi nombre es: $nombre con Edad: $edad");

  /*
  Este trozo de codigo sirve para conocer el tipo de varible
  para ello utilizamos el runtimetype
  */
  print(edad.runtimeType);
  print(nombre.runtimeType);

}
