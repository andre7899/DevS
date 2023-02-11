import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CenterApp',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Center'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text('Contenedor 1'),
            ),
            Container(
              color: Colors.green,
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text('Contenedor 2'),
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amberAccent,
              ),
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text('Contenedor 3'),
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightGreen,
              ),
              padding: const EdgeInsets.all(40),
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text('Contenedor 4'),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                  style: BorderStyle.solid,
                ),
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(40),
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text(
                'Contenedor 5',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              color: Colors.black12,
              width: 60,
              height: 60,
              // padding: const EdgeInsets.all(40),
              margin: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.topRight,
              child: const Icon(
                Icons.car_rental,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              color: Colors.black12,
              // padding: const EdgeInsets.all(40),
              margin: const EdgeInsets.only(bottom: 30),
              alignment: const Alignment(0.8, -0.4), // de -1 a 1
              child: const Icon(
                Icons.car_rental,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
