import 'package:donha_maura_restaurant_app/main.dart';
import 'package:donha_maura_restaurant_app/src/data/repositories/managment.dart';
import 'package:donha_maura_restaurant_app/src/domain/models/dish.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class AddBillDialog extends StatelessWidget {
  AddBillDialog({super.key});

  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Agregar Gasto',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      scrollable: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Producto:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              enabled: true,
              filled: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Cantidad:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
              fillColor: Colors.white,
              enabled: true,
              filled: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Precio por unidad:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              CurrencyInputFormatter(
                  // mantissaLength: widget.decimalDigits,
                  // leadingSymbol: 'S/.',
                  // trailingSymbol: widget.trailingSymbol,
                  // useSymbolPadding: widget.useSymbolPadding,
                  )
            ],
            decoration: const InputDecoration(
              fillColor: Colors.white,
              prefixText: 'S/ ',
              enabled: true,
              filled: true,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: onTapAccept,
          // style: const ButtonStyle(),
          child: const Text('Aceptar'),
        )
      ],
    );
  }

  void onTapAccept() {
    if (!isValid()) return;
    //FIXME: cambiar dish a otro
    final otherDish = Dish(
        name: nameController.text,
        unitPrice: double.tryParse(priceController.text) ?? 0);
    Provider.of<ManagmentProvider>(navigatorKey.currentContext!, listen: false)
        .addBill(
      otherDish,
      int.tryParse(quantityController.text) ?? 0,
    );
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'Se agregó el gasto "${nameController.text}"',
          style: const TextStyle(fontWeight: FontWeight.bold),
        )));

    final reportBox = Hive.box('report');
    reportBox.put(
        'report_saved',
        Provider.of<ManagmentProvider>(navigatorKey.currentContext!,
                listen: false)
            .report
            .toJson());
    Navigator.of(navigatorKey.currentContext!).pop();
  }

  bool isValid() {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(const SnackBar(
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              content: Text(
                'Complete el nombre.',
                style: TextStyle(fontWeight: FontWeight.bold),
              )));
      return false;
    }
    if (quantityController.text.isEmpty) {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(const SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              content: Text(
                'Complete la cantidad.',
                style: TextStyle(fontWeight: FontWeight.bold),
              )));
      return false;
    }
    if (priceController.text.isEmpty) {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(const SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              content: Text(
                'Complete el precio.',
                style: TextStyle(fontWeight: FontWeight.bold),
              )));
      return false;
    }
    return true;
  }
}
