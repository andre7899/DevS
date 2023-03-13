import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_example/myself.dart';

void main() {
  testWidgets(
    'Probando que aparezcan name y age',
    (WidgetTester widgetTester) async {
      // final target = Icon(Icons.camera);
      await widgetTester.pumpWidget(Myself(29, 'Luis'));

      expect(find.text('Luis'), findsOneWidget); //espera un widget
      expect(find.text('29'), findsWidgets); //espera minimo uno

      expect(find.byType(Icon), findsWidgets);

      // final iconFinder = find.byWidget(target);
      // expect(iconFinder, findsOneWidget);
      // expect(find.byType(Icon), findsNWidgets(1));
    },
  );
}
