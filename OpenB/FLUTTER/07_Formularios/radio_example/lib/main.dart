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
      title: 'SwitchApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Switch '),
      debugShowCheckedModeBanner: false,
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
  bool _opcion = false;
  RadioOpcioness _opcionRadio = RadioOpcioness.Avion;
  Icon _iconOpcionRadio = Icon(Icons.airplanemode_active);

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
            Text(
              'Selecciona una opción: ',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            Text(
              'Switch',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: _opcion,
                  activeColor: Colors.green,
                  activeTrackColor: Colors.amber,
                  inactiveTrackColor: Colors.red,
                  inactiveThumbColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      _opcion = value;
                    });
                  },
                ),
                CupertinoSwitch(
                  activeColor: Colors.purple,
                  trackColor: Colors.amber,
                  thumbColor: Colors.black,
                  value: _opcion,
                  onChanged: (value) {
                    setState(() {
                      _opcion = value;
                    });
                  },
                )
              ],
            ),
            Text(
              _opcion ? 'Activado' : 'Desactivado',
            ),
            Divider(),
            Text(
              'Radio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: RadioOpcioness.Coche,
                  groupValue: _opcionRadio,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _opcionRadio = RadioOpcioness.Coche;
                      _iconOpcionRadio = Icon(Icons.directions_car);
                    });
                  },
                ),
                Text(
                  'coche',
                  style: RadioOpcioness.Coche == _opcionRadio
                      ? TextStyle(color: Colors.green)
                      : TextStyle(),
                ),
                Radio(
                  value: RadioOpcioness.Avion,
                  groupValue: _opcionRadio,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _opcionRadio = RadioOpcioness.Avion;
                      _iconOpcionRadio = Icon(Icons.airplanemode_active);
                    });
                  },
                ),
                Text(
                  'Avion',
                  style: RadioOpcioness.Avion == _opcionRadio
                      ? TextStyle(color: Colors.green)
                      : TextStyle(),
                ),
                Radio(
                  value: RadioOpcioness.Barco,
                  groupValue: _opcionRadio,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _opcionRadio = RadioOpcioness.Barco;
                      _iconOpcionRadio = Icon(Icons.directions_boat);
                    });
                  },
                ),
                Text(
                  'Barco',
                  style: RadioOpcioness.Barco == _opcionRadio
                      ? TextStyle(color: Colors.green)
                      : TextStyle(),
                ),
              ],
            ),
            _iconOpcionRadio,
          ],
        ),
      ),
    );
  }
}

enum RadioOpcioness { Coche, Avion, Barco }
