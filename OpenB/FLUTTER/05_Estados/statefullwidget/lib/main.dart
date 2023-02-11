import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefullApp',
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  String title = 'ColorApp';
  Color color = Colors.red;

  State createState() {
    return _MyHome();
  }
}

class _MyHome extends State<MyHome> {
  int red = 0, blue = 0, green = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('El color actual es: '),
            Container(
              color: widget.color,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.7,
              alignment: Alignment.center,
              child: Text(
                  'R (${widget.color.red}) G (${widget.color.green}) B (${widget.color.blue})'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        //si no fuera 'extended', seria child en ves de 'icon'
        icon: const Icon(Icons.colorize_sharp),
        onPressed: _cambiarColor,
        label: Text('Cambio de color'),
      ),
    );
  }

  void _cambiarColor() {
    red = Random.secure().nextInt(256);
    blue = Random.secure().nextInt(256);
    green = Random.secure().nextInt(256);
    setState(() {
      widget.color = Color.fromRGBO(red, green, blue, 1);
    });
  }
}
