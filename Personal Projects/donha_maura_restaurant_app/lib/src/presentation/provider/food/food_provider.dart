import 'package:donha_maura_restaurant_app/main.dart';
import 'package:donha_maura_restaurant_app/src/domain/models/dish.dart';
import 'package:donha_maura_restaurant_app/src/presentation/widgets/add_dish_to_report.dart';
import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier {
  final scrollController = ScrollController();
  final foodList = [
    Dish(name: 'CALDO DE PICURO', unitPrice: 16.00),

    Dish(name: 'GUISO DE PICURO', unitPrice: 16.00),

    Dish(name: 'MECHADO DE PICURO', unitPrice: 16.00),

    Dish(name: 'SOPA DE CARACHUPA', unitPrice: 16.00),

    Dish(name: 'GUISO DE CARACHUPA', unitPrice: 16.00),

    Dish(name: 'CALDO DE GALLINA', unitPrice: 16.00),

    Dish(name: 'CALDO DE PATA', unitPrice: 13.00),

    Dish(name: 'CHICHARRON DE CHANCHO ', unitPrice: 12.00),

    Dish(name: 'CHULETA DE CHANCHO', unitPrice: 16.00),

    Dish(name: 'BISTEC DE HIGADO ENCEBOLLADO', unitPrice: 12.00),

    Dish(name: 'PECHUGA A LA PLANCHA', unitPrice: 12.00),

    Dish(name: 'MILANESA DE POLLO', unitPrice: 12.00),

    Dish(name: 'POLLO FRITO', unitPrice: 12.00),

    Dish(name: 'GUISO DE GALLINA', unitPrice: 15.00),

    Dish(name: 'ESTOFADO DE GALLINA', unitPrice: 15.00),

    Dish(name: 'ESCABECHE DE GALLINA', unitPrice: 15.00),

    Dish(name: 'MECHADO DE GALLINA', unitPrice: 15.00),

    Dish(name: 'ASADO DE GALLINA', unitPrice: 15.00),

    Dish(name: 'GALLINA AL HORNO', unitPrice: 15.00),

    Dish(name: 'GALLINA CON VERDURAS', unitPrice: 15.00),

    Dish(name: 'GALLINA A LA NORTEÑA', unitPrice: 15.00),

    Dish(name: 'SECO DE GALLINA ', unitPrice: 15.00),

    Dish(name: 'ADOBO DE GALLINA', unitPrice: 15.00),

    Dish(name: 'PACHAMANCA DE GALLINA', unitPrice: 15.00),

    Dish(name: 'POLLO AL HORNO', unitPrice: 10.00),

    Dish(name: 'ARROZ CON POLLO', unitPrice: 10.00),

    Dish(name: 'ESTOFADO DE POLLO', unitPrice: 10.00),

    Dish(name: 'SECO DE POLLO', unitPrice: 10.00),

    Dish(name: 'TALLARIN CON POLLO ', unitPrice: 10.00),

    Dish(name: 'MECHADO DE POLLO', unitPrice: 10.00),

    Dish(name: 'AJI DE GALLINA', unitPrice: 12.00),

    Dish(name: 'GUISO DE RES', unitPrice: 10.00),

    Dish(name: 'SECO DE RES', unitPrice: 10.00),
    Dish(name: 'LOMO SALTADO', unitPrice: 12.00),

    Dish(name: 'CAU CAU DE MONDONGO', unitPrice: 10.00),

    Dish(name: 'PESCADO FRITO-TILAPIA', unitPrice: 15.00),

    Dish(name: 'CHILCANO DE TILAPIA', unitPrice: 16.00),

    Dish(name: 'SUDADO DE TILAPIA', unitPrice: 18.00),

    Dish(name: 'CHILCANO DE GAMITANA', unitPrice: 16.00),

    Dish(name: 'SUDADO DE GAMITANA', unitPrice: 18.00),

    Dish(name: 'PESCADO FRITO-GAMITANA', unitPrice: 15.00),
    Dish(name: 'LOMO SALTADO', unitPrice: 25.00),

    Dish(name: 'BISTEC A LO POBRE', unitPrice: 35.00),
    Dish(name: 'BISTEC ENCEBOLLADO', unitPrice: 25.00),

    Dish(name: 'TALLARIN SALTADO', unitPrice: 25.00),

    Dish(name: 'BISTEC A LA PLANCHA', unitPrice: 25.00),
    Dish(name: 'DONCELLA FRITA', unitPrice: 25.00),

    Dish(name: 'APANADO DE DONCELLA', unitPrice: 25.00),

    Dish(name: 'CHICHARRON DE DONCELLA', unitPrice: 30.00),

    Dish(name: 'SUDADO DE DONCELLA', unitPrice: 25.00),
    Dish(name: 'PIQUEOS MIXTOS', unitPrice: 35.00),

    Dish(name: 'CEVICHE MIXTO', unitPrice: 25.00),

    Dish(name: 'CEVICHE SIMPLE', unitPrice: 15.00),

    Dish(name: 'CECINA CON PATACONES', unitPrice: 25.00),

    Dish(name: 'CECINA CON TACACHO', unitPrice: 25.00),

    Dish(name: 'CECINA CON PLTANO FRITO', unitPrice: 25.00),

    Dish(name: 'CHORIZO CON PATACONES', unitPrice: 25.00),

    Dish(name: 'CHORIZO CON TACACHO', unitPrice: 25.00),

    Dish(name: 'CHORIZO CON PLATANO FRITO', unitPrice: 25.00),

    Dish(name: 'CECINA Y CHORIZO (MIXTO)', unitPrice: 30.00),

    Dish(name: 'CHAUFA DE POLLO', unitPrice: 25.00),

    Dish(name: 'CHAUFA REGIONAL', unitPrice: 30.00),

    Dish(name: 'CHAUFA SELVATICA', unitPrice: 35.00),

    Dish(name: 'TACU TACU CON LOMO', unitPrice: 30.00),

    Dish(name: 'SOPA A LA MINUTA', unitPrice: 12.00),

    Dish(name: 'CHICHARRON DE POLLO', unitPrice: 25.00),

    Dish(name: 'CHULETA DORADA', unitPrice: 25.00),

// Dish(name:'SUDADO DE CABRILLA',unitPrice: )

// PARIHUELA

// Dish(name:'ARROZ CON MARISCOS',unitPrice: )

// Dish(name:'LECHE DE TIGRE',unitPrice: )

// Dish(name:'LECHE DE PANTERA',unitPrice: )

// Dish(name:'CHICHARRON DE TOYO',unitPrice: )

// Dish(name:'JALEA DE PESCADO',unitPrice: )
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
