//Estado => isDarkModeProvider = boolean

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// booleando que verifica si el modo oscuro está activado o no
final isDarkModeProvider = StateProvider(
  (ref) => false,
);

//Listado de colores inmutable, solo de lectura
final colorListProvider = Provider(
  (ref) => colorList,
);

//Un simple int
final selectedColorProvider = StateProvider(
  (ref) => 0,
);
