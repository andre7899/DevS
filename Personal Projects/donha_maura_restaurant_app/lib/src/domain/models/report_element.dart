import 'dart:convert';

import 'package:donha_maura_restaurant_app/src/domain/models/dish.dart';

class ReportElement {
  Dish product;
  int quantity;
  ReportElement({
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory ReportElement.fromMap(Map<String, dynamic> map) {
    return ReportElement(
      product: Dish.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportElement.fromJson(String source) =>
      ReportElement.fromMap(json.decode(source));
}
