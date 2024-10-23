import 'package:donha_maura_restaurant_app/src/config/colors.dart';
import 'package:donha_maura_restaurant_app/src/config/image.dart';
import 'package:donha_maura_restaurant_app/src/presentation/provider/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ChangeNotifierProvider(
          create: (context) => SplashProvider(),
          child: Consumer<SplashProvider>(
              child: Hero(
                tag: 'logo',
                child: Center(
                  child: Image.asset(
                    AppImage.pathLogo,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ),
              builder: (context, provider, child) {
                return child!;
              }),
        ),
      ),
    );
  }
}
