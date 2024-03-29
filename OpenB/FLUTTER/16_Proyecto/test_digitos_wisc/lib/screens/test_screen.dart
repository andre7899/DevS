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
      appBar: AppBar(
        title: const Text('Página de test'),
        actions: [
          testProvider.testStarted
              ? IconButton(
                  icon: const Icon(
                    Icons.stop,
                    color: Colors.red,
                    size: 40,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title:
                              const Text('¿Deseas realmente parar el test ?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancelar')),
                            FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  testProvider.pararTest();
                                  Navigator.pop(context);
                                },
                                child: const Text('Parar'))
                          ],
                        );
                      },
                    );
                  },
                )
              : const SizedBox.shrink()
        ],
      ),
      body: Center(
        child: testProvider.testStarted
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(testProvider.testActualString),
                  testProvider.pruebaTest
                      ? const Text(
                          'Ejemplo',
                          style: TextStyle(color: Colors.green),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(testProvider.numerosEnPantalla),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  testProvider.testTerminado
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Test Finalizado',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  ElevatedButton(
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
                  onPressed: () {
                    testProvider.incorrecto();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white),
                  child: const Icon(Icons.close),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    testProvider.correcto();
                  },
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
