import 'dart:convert';

class Dish {
  String name;
  double unitPrice;
  Dish({
    required this.name,
    required this.unitPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'unitPrice': unitPrice,
    };
  }

  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      name: map['name'] ?? '',
      unitPrice: map['unitPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dish.fromJson(String source) => Dish.fromMap(json.decode(source));
}
