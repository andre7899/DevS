void main() {
  final Map<String, dynamic> rawJson = {
    'name': 'Spiderman',
    'power': 'trepar paredes',
    'isAlive': true,
  };
  final spiderman = Hero.fromJson(rawJson);
//   final ironman = Hero(
//   name:'Tony Stark',power:'Money',isAlive:false,);

  print(spiderman.name);
}

class Hero {
  String name;
  String power;
  bool isAlive;

  Hero({
    required this.name,
    required this.power,
    required this.isAlive,
  });

  Hero.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? 'No name found',
        power = json['power'] ?? 'No found',
        isAlive = json['isAlive'] ?? false;

  @override
  String toString() {
    return '$name, $power ${isAlive ? 'YES!' : 'NO'}';
  }
}
