import 'package:donha_maura_restaurant_app/src/config/routes.dart';
import 'package:donha_maura_restaurant_app/src/config/theme.dart';
import 'package:donha_maura_restaurant_app/src/data/repositories/managment.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('report');

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ManagmentProvider(),
      child: MaterialApp(
        title: 'Doña Maura Restaurante App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.materialTheme,
        navigatorKey: navigatorKey,
        initialRoute: AppRoute.SPLASH,
        routes: AppRoute.routes,
      ),
    );
  }
}
