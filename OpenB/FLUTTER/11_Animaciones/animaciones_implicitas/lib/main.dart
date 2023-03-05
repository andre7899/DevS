import 'package:animaciones_implicitas/widgets/animated_container_widget.dart';
import 'package:animaciones_implicitas/widgets/increment_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animaciones_implicitas/providers/contador_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimacionApp',
      //linea de provider
      home: ChangeNotifierProvider(
        create: (_) => ContadorProvider(2),
        child: Scaffold(
          appBar: AppBar(
            title: Text('App Animada'),
          ),
          body: Center(
            child: AnimatedContainerWidget(),
          ),
          floatingActionButton: IncrementWidget(),
        ),
      ),
    );
  }
}
