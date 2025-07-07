import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar tema'),
        actions: [
          IconButton(
              onPressed: () {
                // Otra forma
                ref.read(isDarkModeProvider.notifier).update(
                      (state) => !state,
                    );

                //Otra forma
                // ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
              },
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
      ),
      body: const _ThemeChangexrView(),
    );
  }
}

class _ThemeChangexrView extends ConsumerWidget {
  const _ThemeChangexrView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorListProvider);
    final selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile.adaptive(
          title: Text(
            'Este color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          value: index,
          groupValue: selectedColor,
          activeColor: color,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).update(
                  (state) => value ?? 0,
                );
          },
        );
      },
    );
  }
}
