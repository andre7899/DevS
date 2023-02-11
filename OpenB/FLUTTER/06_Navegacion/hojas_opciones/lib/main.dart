import 'package:flutter/cupertino.dart';
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
  String _botonPulsado = 'Ninguna';

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
            ElevatedButton(
              onPressed: _elegirBottomSheep,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child: const Text('Abrir BottomSheet'),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            ElevatedButton(
              onPressed: _elegirBottomSheepCupertino,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child: const Text('Abrir Bottomsheet Cupertino'),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            Text(
              'La eleccion de $_botonPulsado es:',
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
        _opcionElegida('Coche', 0);
        break;
      case ListaOpciones.Avion:
        _opcionElegida('Avion', 0);
        break;
      case ListaOpciones.Barco:
        _opcionElegida('Barco', 0);
        break;
    }
  }

  Future<void> _elegirBottomSheep() async {
    //aqui retorna un valor de la opcion de simple dialog
    switch (await showModalBottomSheet(
      isDismissible: false, //se puede arrastrar hacia abajo xdd
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            color: Colors.green,
            child: Column(
              children: [
                Text(
                  'Selecciona una opcion.:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
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
                Divider(),
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
                Divider(),
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
            ),
          ),
        );
      },
    )) {
      case ListaOpciones.Coche:
        _opcionElegida('Coche', 1);
        break;
      case ListaOpciones.Avion:
        _opcionElegida('Avion', 1);
        break;
      case ListaOpciones.Barco:
        _opcionElegida('Barco', 1);
        break;
    }
  }

  Future<void> _elegirBottomSheepCupertino() async {
    //aqui retorna un valor de la opcion de simple dialog
    switch (await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Elige una opción de transporte'),
          actions: [
            //lo mismo pero en vez de simpleDialogOption, lo de abajo
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context, ListaOpciones.Coche),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.directions_car),
                  Text('Cochee'),
                ],
              ),
            ),
            CupertinoActionSheetAction(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.airplanemode_active),
                  Text('Avionn'),
                ],
              ),
              onPressed: () => Navigator.pop(context, ListaOpciones.Avion),
            ),
            CupertinoActionSheetAction(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.directions_boat),
                  Text('Barco'),
                ],
              ),
              onPressed: () => Navigator.pop(context, ListaOpciones.Barco),
            )
          ],
        );
      },
    )) {
      case ListaOpciones.Coche:
        _opcionElegida('Coche', 2);
        break;
      case ListaOpciones.Avion:
        _opcionElegida('Avion', 2);
        break;
      case ListaOpciones.Barco:
        _opcionElegida('Barco', 2);
        break;
    }
  }

  void _opcionElegida(String opcion, int identificador) {
    //NOLVIDAR!!
    setState(() {
      switch (identificador) {
        case 0:
          _botonPulsado = 'SimpleDialog';
          break;
        case 1:
          _botonPulsado = 'BottomSheet';
          break;
        case 2:
          _botonPulsado = 'BottomSheet Cupertino';
          break;
      }
      _opcion = opcion;
    });
  }
}

enum ListaOpciones { Coche, Avion, Barco }

//Notas
//Para presentar info preferible alertDialog