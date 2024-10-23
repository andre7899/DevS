import 'package:donha_maura_restaurant_app/main.dart';
import 'package:donha_maura_restaurant_app/src/config/routes.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider() {
    loginWithToken();
  }

  void loginWithToken() async {
    await Future.delayed(Durations.extralong4);
    Navigator.of(navigatorKey.currentContext!)
        .pushNamedAndRemoveUntil(AppRoute.PRINCIPAL, (route) => false);
  }
}
