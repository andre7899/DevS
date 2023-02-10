import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Hola mundo App',
      home: SafeArea(child: MyHelloWorldApp()),
    ),
  );
}

class MyHelloWorldApp extends StatelessWidget {
  const MyHelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        Container(
          height: 50,
          padding: EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.blue),
          child: Row(
            children: const [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.menu),
                tooltip: 'Boton de navegacion',
              ),
              Expanded(child: Text('App Hola mundoo')),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.search),
                tooltip: 'Boton de búsqueda',
              )
            ],
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Hola mundo',
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      ]),
    );
  }
}
