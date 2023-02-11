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
      title: 'StepperApp',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Stepper'),
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
  List<Step> steps = [
    Step(title: Text('Caja 1'), content: Text('Contenido de la caja1')),
    Step(title: Text('Caja 2'), content: Text('Contenido de la caja2')),
    Step(title: Text('Caja 3'), content: Text('Contenido de la caja3')),
    Step(title: Text('Caja 4'), content: Text('Contenido de la caja4')),
    Step(title: Text('Caja 5'), content: Text('Contenido de la caja5')),
  ];

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Stepper',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Stepper(
            steps: steps,
            currentStep: _currentStep,
            onStepContinue: _pasoSiguiente,
            onStepCancel: _pasoAnterior,
          ),
        ],
      ),
    );
  }

  void _pasoSiguiente() {
    //NO OLVIDAR!!!!!!
    setState(() {
      _currentStep++;
    });
  }

  void _pasoAnterior() {
    //NO OLVIDAR!!!!!!
    setState(() {
      _currentStep--;
    });
  }
}
