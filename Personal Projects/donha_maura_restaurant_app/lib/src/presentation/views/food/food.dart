import 'package:donha_maura_restaurant_app/src/config/colors.dart';
import 'package:donha_maura_restaurant_app/src/presentation/provider/food/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodsPage extends StatelessWidget {
  FoodsPage({super.key});
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comidas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => FoodProvider(),
        child: Consumer<FoodProvider>(builder: (context, provider, _) {
          return RawScrollbar(
            thumbColor: AppColors.primary,
            radius: const Radius.circular(10),
            thumbVisibility: true,
            controller: scrollController,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView.separated(
                controller: scrollController,
                padding: const EdgeInsets.all(20),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: provider.foodList.length,
                itemBuilder: (context, index) {
                  final dish = provider.foodList[index];
                  final name = dish.name;

                  return FilledButton(
                    onPressed: () => provider.onTapAddDishToReport(dish),
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
