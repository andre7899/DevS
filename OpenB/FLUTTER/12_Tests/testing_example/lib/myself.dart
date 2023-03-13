import 'package:flutter/material.dart';

class Myself extends StatelessWidget {
  const Myself(this.age, this.name, {super.key});

  final int age;
  final String name;

  @override
  Widget build(BuildContext context) {
    //no olvidar maaterialApp con scaffold para los test
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Text('$age'),
            Text('$name'),
            Icon(Icons.camera),
          ],
        ),
      ),
    );
  }
}
