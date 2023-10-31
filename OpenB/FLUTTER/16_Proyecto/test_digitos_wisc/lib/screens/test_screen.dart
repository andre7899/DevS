import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_digitos_wisc/providers/testprovider.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<CustomTestProvider>(context);
    final textController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            testProvider.testStarted
                ? Text(testProvider.numerosEnPantalla)
                : ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Comenzar Test'),
                            content: TextField(
                              controller: textController,
                              decoration: const InputDecoration(
                                  hintText: 'Introduce el código'),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  testProvider
                                      .comenzarTest(textController.text);
                                  Navigator.pop(context);
                                },
                                child: const Text('Comenzar'),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Comenzar Test'))
          ],
        ),
      ),
      floatingActionButton: testProvider.testStarted
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white),
                  child: const Icon(Icons.close),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white),
                  child: const Icon(Icons.done),
                ),
                // FloatingActionButton(
                //   onPressed: () {},
                //   backgroundColor: Colors.green,
                //   child: const Icon(Icons.done),
                // )
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
