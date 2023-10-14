import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  bool bookMarked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Lottie.network(
                'https://lottie.host/ca6cfb8e-67f1-4274-93d8-e0cb54e689e2/u1Z3V5kJ1L.json'),
            GestureDetector(
              onTap: () {
                if (bookMarked == false) {
                  bookMarked = true;
                  _controller.forward();
                } else {
                  bookMarked = false;
                  _controller.reverse();
                }
              },
              child: Lottie.network(
                  'https://lottie.host/e6ee2db3-4030-465c-a4ee-a448b6d06f37/pF85CtAT38.json',
                  controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}
