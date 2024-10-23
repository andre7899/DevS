import 'package:donha_maura_restaurant_app/main.dart';
import 'package:donha_maura_restaurant_app/src/domain/models/dish.dart';
import 'package:donha_maura_restaurant_app/src/presentation/widgets/add_dish_to_report.dart';
import 'package:flutter/material.dart';

class DrinksProvider extends ChangeNotifier {
  final scrollController = ScrollController();
  final drinkList = [
    Dish(name: 'GASEOSA COCACOLA  1.5  LITROS', unitPrice: 10.00),
    Dish(name: 'GASEOSA INCACOLA 1.5 LITROS', unitPrice: 10.00),
    Dish(name: 'GASEOSA COCACOLA 1.0 LITROS', unitPrice: 9.00),
    Dish(name: 'GASEOSA INCACOLA 1.0 LITROS', unitPrice: 9.00),
    Dish(name: 'GASEOSA COCACOLA 1/2 LITRO', unitPrice: 4.00),
    Dish(name: 'GASEOSA INCACOLA 1/2 LITRO', unitPrice: 4.00),
    Dish(name: 'AGUA MINERAL 650 ML', unitPrice: 2.50),
    Dish(name: 'GASEOSA GORDITA INCACOLA', unitPrice: 5.00),
    Dish(name: 'REFRESCO CHICHAMORADA-1.0 L', unitPrice: 10.00),
    Dish(name: 'REFRESCO DE CEBADA 1 LITRO', unitPrice: 6.00),
    Dish(name: 'REFRESCO DE COCONA 1 LITRO', unitPrice: 7.00),
    Dish(name: 'REFRESCO DE MARACUYA 1 LITRO', unitPrice: 7.00),
    Dish(name: 'REFRESCO CAMUCAMU - 1.0 LITRO', unitPrice: 15.00),
    Dish(name: 'TASA DE CAFÉ', unitPrice: 2.00),
    Dish(name: 'TASA  DE INFUSIN DE MANZANILLA ', unitPrice: 2.00),
    Dish(name: 'TASA DE INFUSIN DE ANIS', unitPrice: 2.00),
    Dish(name: 'REFRESCO DE CHICHA MORADA 500 ML', unitPrice: 4.00),
    Dish(name: 'REFRESCO DE COCONA 500ML', unitPrice: 4.00),
    Dish(name: 'VASO DE REFRESCO ', unitPrice: 1.00),
  ];
  void onTapAddDishToReport(Dish dish) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AddDisahToReport(dish: dish);
      },
    );
  }
}
