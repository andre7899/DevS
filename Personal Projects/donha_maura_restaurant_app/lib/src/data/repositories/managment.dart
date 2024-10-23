import 'package:donha_maura_restaurant_app/src/domain/models/dish.dart';
import 'package:donha_maura_restaurant_app/src/domain/models/report.dart';
import 'package:donha_maura_restaurant_app/src/domain/models/report_element.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ManagmentProvider extends ChangeNotifier {
  Report report = Report(billsReportList: [], elementsReportList: []);

  // int get totalQuantityReport {
  //   int quantity = 0;
  //   for (var e in report.elementsReportList) {
  //     quantity = quantity + e.quantity;
  //   }
  //   return quantity;
  // }

  // double get subTotalReport {
  //   double sum = 0;
  //   for (var element in report.elementsReportList) {
  //     sum = sum + element.quantity * element.product.unitPrice;
  //   }
  //   return sum;
  // }

  void addProductToReport(Dish dish, [int quantity = 1]) {
    if (quantity == 0) return;
    for (var element in report.elementsReportList) {
      if (element.product.name == dish.name) {
        element.quantity = element.quantity + quantity;
        return;
      }
    }
    report.elementsReportList
        .add(ReportElement(product: dish, quantity: quantity));
  }

  void addBill(Dish dish, [int quantity = 1]) {
    if (quantity == 0) return;
    for (var element in report.billsReportList) {
      if (element.product.name == dish.name) {
        element.quantity = element.quantity + quantity;
        return;
      }
    }
    report.billsReportList
        .add(ReportElement(product: dish, quantity: quantity));
  }

  void clearReport() {
    report.clear();
    final reportBox = Hive.box('report');
    reportBox.clear();
  }
}
