import 'dart:math';

import 'package:donha_maura_restaurant_app/src/config/colors.dart';
import 'package:donha_maura_restaurant_app/src/domain/models/report_element.dart';
import 'package:donha_maura_restaurant_app/src/presentation/provider/report/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final managmentProvider = context.watch<ManagmentProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reporte',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ReportProvider(),
        child: Consumer<ReportProvider>(builder: (context, provider, _) {
          return PageView.builder(
            controller: provider.pageController,
            itemCount: provider.infoList.length,
            itemBuilder: (context, index) {
              final list = provider.infoList[index];
              // final fixedCurrentPage = provider.currentPage-1;
              final percent = (provider.currentPage - index);
              final value = percent;
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0008)
                  ..rotateY((-pi / 2) * value),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Opacity(
                    opacity: 1 - value.clamp(-1, 1).abs().toDouble(),
                    child: ReportTable(
                      list: list,
                      hasActions: index == 1,
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class ReportTable extends StatelessWidget {
  const ReportTable({
    super.key,
    this.hasActions = false,
    required this.list,
  });

  final bool hasActions;

  final List<ReportElement> list;
  double get subTotal {
    double sum = 0;
    for (var element in list) {
      sum = sum + element.quantity * element.product.unitPrice;
    }
    return sum;
  }

  int get totalQuantity {
    int quantity = 0;
    for (var e in list) {
      quantity = quantity + e.quantity;
    }
    return quantity;
  }

  @override
  Widget build(BuildContext context) {
    // final managmentProvider = context.watch<ManagmentProvider>();
    final provider = context.watch<ReportProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            hasActions ? 'Egresos' : 'Ingresos',
            style: const TextStyle(fontSize: 25),
          ),
        ),
        Expanded(
          child: Card(
            color: AppColors.primary,
            surfaceTintColor: Colors.white,
            child: Column(
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                      border: BorderDirectional(bottom: BorderSide())),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Producto',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Cantidad',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Subtotal',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final elementReport = list[index];
                      final productName = elementReport.product.name;
                      final quantity = elementReport.quantity;
                      final subTotal =
                          quantity * elementReport.product.unitPrice;
                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                productName,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '$quantity',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                subTotal.toStringAsFixed(2),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                DecoratedBox(
                  decoration: const BoxDecoration(
                      border: BorderDirectional(top: BorderSide())),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Total',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$totalQuantity',
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            subTotal.toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (hasActions)
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: provider.onTapGenerateReport,
                              child: const Text('Generar Reporte')),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: provider.onTapDeleteReport,
                              child: const Text('Eliminar reporte')),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
