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
      title: 'SimpleDialogApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Simple Dialog'),
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
  String _opcion = 'Ninguna';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _elegirOpcion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child: const Text('Abrir simpleDialog'),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            const Text(
              'La eleccion es',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 30,
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            Text(
              _opcion,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _elegirOpcion() async {
    //aqui retorna un valor de la opcion de simple dialog
    switch (await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Selecciona una opcion de trasnporte'),
          children: [
            SimpleDialogOption(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.directions_car),
                  Text('Cochee'),
                ],
              ),
              onPressed: () => Navigator.pop(context, ListaOpciones.Coche),
            ),
            SimpleDialogOption(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.airplanemode_active),
                  Text('Avionn'),
                ],
              ),
              onPressed: () => Navigator.pop(context, ListaOpciones.Avion),
            ),
            SimpleDialogOption(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.directions_boat),
                  Text('Barcoo'),
                ],
              ),
              onPressed: () => Navigator.pop(context, ListaOpciones.Barco),
            )
          ],
        );
      },
    )) {
      case ListaOpciones.Coche:
        _opcionElegida('Coche');
        break;
      case ListaOpciones.Avion:
        _opcionElegida('Avion');
        break;
      case ListaOpciones.Barco:
        _opcionElegida('Barco');
        break;
    }
  }

  void _opcionElegida(String opcion) {
    //NOLVIDAR!!
    setState(() {
      _opcion = opcion;
    });
  }
}

enum ListaOpciones { Coche, Avion, Barco }

//Notas
//Para presentar info preferible alertDialog
