void main(List<String> args) {
  final myMeal = Meal();
  myMeal.description = 'Feijoada!';
  print(myMeal._description);
}

class Meal {
  late String _description;

  String get description => this._description;

  set description(String value) =>
      this._description = 'Meal description: $value';
}
