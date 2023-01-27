void main(List<String> arguments) {
  identificacion('Andre', 'Amaya', 1999);
  identificacion2('Andre', 'Amaya', anho: 1999, edad: 23);
}

void identificacion(String nombre, String apellido,
    [var edad, var anhoNacimiento]) {
  //los corchetes para opcional
  if (edad == null) {
    print(
        'La persona es $nombre, su apellido es $apellido y no conocemos su edad');
  } else {
    print('La persona es $nombre, su apellido es $apellido y su edad: $edad');
  }
}

void identificacion2(String nombre, String apellido, {var edad, var anho}) {
  //para poder escribir el parametro que necesitmaos
  if (edad == null) {
    print(
        'La persona es $nombre, su apellido es $apellido y no conocemos su edad');
  } else {
    print('La persona es $nombre, su apellido es $apellido y su edad: $edad');
  }
}
