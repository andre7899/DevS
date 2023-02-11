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
      body: Center(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.amber,
              child: Text('A'),
            ),
            Expanded(
              flex: 4, //factor
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.red,
                child: Text('A'),
              ),
            ),
            Expanded(
              flex: 8, //factor
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Text('A'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
