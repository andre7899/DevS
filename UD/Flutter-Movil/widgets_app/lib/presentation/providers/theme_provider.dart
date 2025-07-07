//Estado => isDarkModeProvider = boolean

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado de colores inmutable, solo de LECTURA
final colorListProvider = Provider(
  (ref) => colorList,
);

//Stae provider mantiene una pieza de estado

// booleando que verifica si el modo oscuro está activado o no
final isDarkModeProvider = StateProvider(
  (ref) => false,
);

//Un simple int
final selectedColorProvider = StateProvider(
  (ref) => 0,
);
// Un objeto de tipo appTheme (custom), CUANDO ES ESTADO ES MAS ELABORADO
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  // ThemeNotifier(super.state);
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(
      isDarkMode: !state.isDarkMode,
    );
  }

  void updateSelectedColor(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
