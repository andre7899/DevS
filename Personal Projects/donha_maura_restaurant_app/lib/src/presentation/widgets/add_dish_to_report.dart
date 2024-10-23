import 'package:donha_maura_restaurant_app/main.dart';
import 'package:donha_maura_restaurant_app/src/data/repositories/managment.dart';
import 'package:donha_maura_restaurant_app/src/domain/models/dish.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class AddDisahToReport extends StatelessWidget {
  const AddDisahToReport({super.key, required this.dish});

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Agregar ${dish.name}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        ElevatedButton(
          onPressed: onTapAccept,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text('Sí'),
        ),
        ElevatedButton(
          onPressed: onTapCancel,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.black,
          ),
          child: const Text('No'),
        ),
      ],
    );
  }

  void onTapAccept() {
    Provider.of<ManagmentProvider>(navigatorKey.currentContext!, listen: false)
        .addProductToReport(
      dish,
      1,
    );
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'Se agregó el plato "${dish.name}"',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
    final reportBox = Hive.box('report');
    reportBox.put(
        'report_saved',
        Provider.of<ManagmentProvider>(navigatorKey.currentContext!,
                listen: false)
            .report
            .toJson());

    Navigator.of(navigatorKey.currentContext!).pop();
  }

  void onTapCancel() {
    Navigator.of(navigatorKey.currentContext!).pop();
  }
}
