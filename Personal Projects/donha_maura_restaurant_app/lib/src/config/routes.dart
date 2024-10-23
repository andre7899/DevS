// ignore_for_file: constant_identifier_names

import 'package:donha_maura_restaurant_app/src/presentation/views/drinks/drinks.dart';
import 'package:donha_maura_restaurant_app/src/presentation/views/food/food.dart';
import 'package:donha_maura_restaurant_app/src/presentation/views/principal/principal.dart';
import 'package:donha_maura_restaurant_app/src/presentation/views/report/report.dart';
import 'package:donha_maura_restaurant_app/src/presentation/views/splash/splash.dart';
import 'package:flutter/material.dart';

abstract class AppRoute {
  static const INDEX = '/';
  static const LOGIN = '/login';
  static const SPLASH = '/splash';
  static const PRINCIPAL = '/principal';
  static const FOODS = '/foods';
  static const DRINKS = '/drinks';
  static const REPORT = '/report';

  static final Map<String, Widget Function(BuildContext)> routes = {
    SPLASH: (p0) => const SplashPage(),
    PRINCIPAL: (p0) => const PrincipalPage(),
    FOODS: (p0) => FoodsPage(),
    DRINKS: (p0) => const DrinksPage(),
    REPORT: (p0) => const ReportPage(),
  };
}
