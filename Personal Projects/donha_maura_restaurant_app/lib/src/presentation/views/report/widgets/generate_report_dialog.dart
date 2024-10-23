import 'package:donha_maura_restaurant_app/main.dart';
import 'package:flutter/material.dart';

class GenerateReportDialolg extends StatelessWidget {
  const GenerateReportDialolg({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        '¿Generar Reporte?',
        textAlign: TextAlign.center,
        style: TextStyle(
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
    Navigator.of(navigatorKey.currentContext!).pop(true);
  }

  void onTapCancel() {
    Navigator.of(navigatorKey.currentContext!).pop();
  }
}
