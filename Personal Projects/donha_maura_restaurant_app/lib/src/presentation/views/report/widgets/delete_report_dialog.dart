import 'package:donha_maura_restaurant_app/main.dart';
import 'package:donha_maura_restaurant_app/src/data/repositories/managment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteReportDialog extends StatelessWidget {
  const DeleteReportDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        '¿Elimninar Reporte?',
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
    Provider.of<ManagmentProvider>(navigatorKey.currentContext!, listen: false)
        .clearReport();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(
          'Se eliminó el reporte',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
    Navigator.of(navigatorKey.currentContext!).pop();
  }

  void onTapCancel() {
    Navigator.of(navigatorKey.currentContext!).pop();
  }
}
