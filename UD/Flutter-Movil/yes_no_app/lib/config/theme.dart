import 'package:flutter/material.dart';

const Color customColor = Color(0xff44149f);
const List<Color> colorThemes = [
  customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.orange,
  Colors.yellow,
  Colors.pink,
];

//Assert valida si el contenido es verdadero, si es asi, continua con normalidad
class AppTheme {
  final int selectedColor;
  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0 && selectedColor < colorThemes.length,
            'Colors must be between 0 and ${colorThemes.length}');
  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: colorThemes[selectedColor],
      // brightness: Brightness.dark,
    );
  }
}
