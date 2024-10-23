import 'dart:convert';

import 'package:donha_maura_restaurant_app/src/domain/models/report_element.dart';

class Report {
  List<ReportElement> elementsReportList;

  List<ReportElement> billsReportList;
  double get subTotalSales {
    double sum = 0;
    for (var element in elementsReportList) {
      sum = sum + element.quantity * element.product.unitPrice;
    }
    return sum;
  }

  int get totalQuantitySales {
    int quantity = 0;
    for (var e in elementsReportList) {
      quantity = quantity + e.quantity;
    }
    return quantity;
  }

  double get subTotalBills {
    double sum = 0;
    for (var element in billsReportList) {
      sum = sum + element.quantity * element.product.unitPrice;
    }
    return sum;
  }

  int get totalQuantityBills {
    int quantity = 0;
    for (var e in billsReportList) {
      quantity = quantity + e.quantity;
    }
    return quantity;
  }

  Report({
    this.elementsReportList = const [],
    this.billsReportList = const [],
  });

  void clear() {
    elementsReportList.clear();
    billsReportList.clear();
  }

  Map<String, dynamic> toMap() {
    return {
      'elementsReportList': elementsReportList.map((x) => x.toMap()).toList(),
      'billsReportList': billsReportList.map((x) => x.toMap()).toList(),
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      elementsReportList: List<ReportElement>.from(
          map['elementsReportList']?.map((x) => ReportElement.fromMap(x))),
      billsReportList: List<ReportElement>.from(
          map['billsReportList']?.map((x) => ReportElement.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) => Report.fromMap(json.decode(source));
}
