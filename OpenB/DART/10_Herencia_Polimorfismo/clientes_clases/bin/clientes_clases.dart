import 'direccion.dart';
import 'personas.dart';
import 'profesion.dart';
import 'trabajador.dart';
import 'trabajadorextension.dart';
import 'usuarios.dart';

void main(List<String> arguments) {
  //creamos una instancia direccion que sera atributo de una instancia de persona
  Direccion direccionLuis = Direccion(1, 'Sal si puedes', '23001', 'Jaen');

  Personas luis = Personas('Luis',
      edad: 29, direccion: direccionLuis, telefono: '666666666');

  print(luis.direccion!.ciudad);
  luis.direccion?.ciudad = 'Cordova';
  print(luis.direccion!.codPostal);
  print(luis.direccion!.ciudad);

  //Herencia
  Trabajador pedro = Trabajador('Pedro', 1500);
  pedro.telefono = '666666666';
  pedro.direccion = direccionLuis;

  print('El empleado se llama: ${pedro.nombre}');
  print('El empleado gana: ${pedro.salario}');

  print(pedro.runtimeType);

// se puede hacer esta asignacion cuando es hija heredada
  Personas daniel = pedro; //polimorfismo
  // print(daniel.salario);//no se puede, salario existe solo en 'trabajdor'
  print(daniel.runtimeType);
  print(daniel.nombre);

  // Usuarios marta = pedro;//no se puede
  // Trabajador nuevo = luis;//no se puede

  //Sobrecarga de metodos
  print(luis.hablar('Hola'));
  print(pedro.hablar('Hola también'));

  //Interfaz
  //interfaz no metemos codigo ni atributos funcionales, se usa override
  pedro.caminar();

  //Mixing
  //usamos codigo sin heredar
  //con with (mixing) ya no tendremos que hacer override
  Usuarios maria = Usuarios('María', 'maria', 'maria');
  maria.profesion = 'Programadora';
  List competencias = ['Dart', 'Flutter', 'Java'];
  print(maria.competencias(competencias));
  print(maria.profesion);

  //Extension
  //para modificar la clase trabajador sin tocar la clase
  //No es una clase, solo extension
  print('El salario de ${pedro.nombre} en dólares es:' +
      ' ${pedro.convertirADolares(pedro.salario).toStringAsFixed(2)}');

  //Uso de static
  double conversion = TrabajadorExtension.obtenerValorCambio();
  print(
      'La conversion de euros a dolares se hace al multiplicar por $conversion');
}
