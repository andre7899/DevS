void main() {
  final String pokemon = 'Ditto';
  final int hp = 100;
  final bool isAlive = true;
  final List<String> abilities = ['impostor'];
  final sprites = <String>['ditto/front.png', 'ditto/back.png'];

//dynamic ==null
  dynamic errorMessagge = 'Hola';
  errorMessagge = true;
  errorMessagge = [1, 2, 3, 4, 5, 6];
  errorMessagge = {1, 2, 3, 4, 5, 6};
  errorMessagge = () => true;
  errorMessagge = null;

  errorMessagge += 1;

  print('''
  $pokemon
  $hp
  $isAlive
  $abilities
  $sprites
  ''');
}
