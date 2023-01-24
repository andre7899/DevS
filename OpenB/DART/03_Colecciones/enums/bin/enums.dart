enum EstadosUsuario {  notlogged,logged,logging,registering}

void main(List<String> arguments) {
  var estadoActual = EstadosUsuario.notlogged;

  print(estadoActual);

  //Aqui pasa algo y se logea

  estadoActual = EstadosUsuario.logged;
}
