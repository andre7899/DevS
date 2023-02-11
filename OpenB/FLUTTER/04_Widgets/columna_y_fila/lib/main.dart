import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CenterApp',
      home: const MyHomePage(title: 'Center'),
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
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.home, color: Colors.amber),
              Icon(Icons.android, color: Colors.deepOrange),
              Icon(Icons.build, color: Colors.blue),
              Icon(Icons.phone, color: Colors.red),
              Icon(Icons.group, color: Colors.purple),
              Icon(Icons.heart_broken, color: Colors.green),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.home, color: Colors.amber),
              Icon(Icons.android, color: Colors.deepOrange),
              Icon(Icons.build, color: Colors.blue),
              Icon(Icons.phone, color: Colors.red),
              Icon(Icons.group, color: Colors.purple),
              Icon(Icons.heart_broken, color: Colors.green),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.home, color: Colors.amber),
              Icon(Icons.android, color: Colors.deepOrange),
              Icon(Icons.build, color: Colors.blue),
              Icon(Icons.phone, color: Colors.red),
              Icon(Icons.group, color: Colors.purple),
              Icon(Icons.heart_broken, color: Colors.green),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.home, color: Colors.amber),
              Icon(Icons.android, color: Colors.amber),
              Icon(Icons.build, color: Colors.amber),
              Icon(Icons.phone, color: Colors.amber),
              Icon(Icons.group, color: Colors.amber),
              Icon(Icons.heart_broken, color: Colors.amber),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.home, color: Colors.red),
              Icon(Icons.android, color: Colors.red),
              Icon(Icons.build, color: Colors.red),
              Icon(Icons.phone, color: Colors.red),
              Icon(Icons.group, color: Colors.red),
              Icon(Icons.heart_broken, color: Colors.red),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.home, color: Colors.green),
              Icon(Icons.android, color: Colors.green),
              Icon(Icons.build, color: Colors.green),
              Icon(Icons.phone, color: Colors.green),
              Icon(Icons.group, color: Colors.green),
              Icon(Icons.heart_broken, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
