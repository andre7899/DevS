import 'direccion.dart';
import 'personas.dart';

void main(List<String> arguments) {
  //creamos una instancia direccion que sera atributo de una instancia de persona
  Direccion direccionLuis = Direccion(1, 'Sal si puedes', '23001', 'Jaen');

  Persona luis = Persona('Luis',
      edad: 29, direccion: direccionLuis, telefono: '666666666');

  print(luis.direccion!.ciudad);
  luis.direccion?.ciudad = 'Cordova';
  print(luis.direccion!.codPostal);
  print(luis.direccion!.ciudad);
}
