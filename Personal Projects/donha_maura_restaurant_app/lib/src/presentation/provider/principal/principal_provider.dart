import 'dart:convert';

import 'package:donha_maura_restaurant_app/main.dart';
import 'package:donha_maura_restaurant_app/src/config/routes.dart';
import 'package:donha_maura_restaurant_app/src/data/repositories/managment.dart';
import 'package:donha_maura_restaurant_app/src/domain/models/report.dart';
import 'package:donha_maura_restaurant_app/src/presentation/views/principal/widgets/add_bill_dialog.dart';
import 'package:donha_maura_restaurant_app/src/presentation/views/principal/widgets/add_others_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class PrincipalProvider extends ChangeNotifier {
  PrincipalProvider() {
    final reportBox = Hive.box('report');
    if (reportBox.get('report_saved') != null) {
      Provider.of<ManagmentProvider>(navigatorKey.currentContext!,
                  listen: false)
              .report =
          Report.fromMap((json.decode(reportBox.get('report_saved'))));
    }
  }
  final scrollController = ScrollController();

  void onTapFood() {
    Navigator.of(navigatorKey.currentContext!).pushNamed(AppRoute.FOODS);
  }

  void onTapDrink() {
    Navigator.of(navigatorKey.currentContext!).pushNamed(AppRoute.DRINKS);
  }

  void onTapOthers() {
    // Navigator.of(navigatorKey.currentContext!).pushNamed(AppRoute.FOODS);
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AddOthersDialog();
      },
    );
  }

  void onTapBills() {
    // Navigator.of(navigatorKey.currentContext!).pushNamed(AppRoute.FOODS);
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AddBillDialog();
      },
    );
  }

  void onTapReport() {
    Navigator.of(navigatorKey.currentContext!).pushNamed(AppRoute.REPORT);
  }
}
