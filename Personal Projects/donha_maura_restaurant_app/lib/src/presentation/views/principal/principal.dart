import 'package:donha_maura_restaurant_app/src/config/colors.dart';
import 'package:donha_maura_restaurant_app/src/config/image.dart';
import 'package:donha_maura_restaurant_app/src/presentation/provider/principal/principal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: ChangeNotifierProvider(
          create: (context) => PrincipalProvider(),
          child: Consumer<PrincipalProvider>(
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  AppImage.pathLogo,
                  height: 200,
                ),
              ),
              builder: (context, provider, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    child!,
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: RawScrollbar(
                        thumbColor: AppColors.primary,
                        radius: const Radius.circular(10),
                        thumbVisibility: true,
                        controller: provider.scrollController,
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: ListView(
                            padding: const EdgeInsets.all(20),
                            controller: provider.scrollController,
                            children: [
                              FilledButton(
                                onPressed: provider.onTapFood,
                                child: const Text('Comidas'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FilledButton(
                                onPressed: provider.onTapDrink,
                                child: const Text('Bebidas'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FilledButton(
                                onPressed: provider.onTapOthers,
                                child: const Text('Otros'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FilledButton(
                                onPressed: provider.onTapBills,
                                child: const Text('Gastos'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FilledButton(
                                onPressed: provider.onTapReport,
                                child: const Text('Reporte'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
