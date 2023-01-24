
void main(List<String> arguments) {
  var miPrimerMapa = {
    "nombre":"luis",
    "edad":29,
    "email":"andre.amayam.e@uni.pe",
    "buenProfesor":true
  };

  print(miPrimerMapa);

  //añadimos informacion
  miPrimerMapa["Ciudad"] = "Lima";

  //Modificamos info que ya existe
  miPrimerMapa["buenProfesor"] = 3;

  print(miPrimerMapa);
  print(miPrimerMapa.length);

  var lista = ["Andre", "Estefano", "Luis"];

  print(lista.asMap());//nos pone por defecto 0,1,2,... como claves del mapa
}
