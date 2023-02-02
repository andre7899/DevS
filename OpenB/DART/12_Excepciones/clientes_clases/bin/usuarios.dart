import 'personas.dart';
import 'profesion.dart';

//con with (mixing) ya no tendremos que hacer override
class Usuarios extends Personas with Profesion {
  // podemos quitar el '?' ya que se obtendrá del constructor
  String nombreUsuario;
  String contrasenha;

  // Usuarios(super.nombre);

  Usuarios(String nombre, this.nombreUsuario, this.contrasenha) : super(nombre);
}
