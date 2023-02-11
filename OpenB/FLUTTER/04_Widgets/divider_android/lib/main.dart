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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30), //paddin interno
              color: Colors.amber,
              child: Text('A'),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                color: Colors.red,
                child: Text('A'),
              ),
            ),
            const Divider(
              color: Colors.purple,
              indent: 40,
              endIndent: 100,
              thickness: 5,
              height: 20,
            ),
            Padding(padding: EdgeInsets.all(4)),

            //
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              color: Colors.blue,
              child: Text('A'),
            ),
          ],
        ),
      ),
    );
  }
}
