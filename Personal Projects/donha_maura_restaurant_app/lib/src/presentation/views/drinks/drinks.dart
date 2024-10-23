import 'package:donha_maura_restaurant_app/src/config/colors.dart';
import 'package:donha_maura_restaurant_app/src/presentation/provider/drinks/drinks_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrinksPage extends StatelessWidget {
  const DrinksPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bebidas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => DrinksProvider(),
        child: Consumer<DrinksProvider>(builder: (context, provider, _) {
          return RawScrollbar(
            thumbColor: AppColors.primary,
            radius: const Radius.circular(10),
            thumbVisibility: true,
            controller: provider.scrollController,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                controller: provider.scrollController,
                itemCount: provider.drinkList.length,
                itemBuilder: (context, index) {
                  final dish = provider.drinkList[index];
                  final name = dish.name;

                  return FilledButton(
                      onPressed: () => provider.onTapAddDishToReport(dish),
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                      ));
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
