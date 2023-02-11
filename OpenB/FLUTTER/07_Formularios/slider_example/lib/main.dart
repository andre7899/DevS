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
      title: 'FormsApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Forms '),
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
  Map _opcionCheckbox = {
    RadioOpcioness.Coche: false,
    RadioOpcioness.Avion: false,
    RadioOpcioness.Barco: false
  };
  double _opcionSlider = 0;

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
              'Radio (para elegir una opcion)',
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
            Divider(),
            Text(
              'Checkbox (para elegir multiples opciones)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Coche',
                  style: _opcionCheckbox[RadioOpcioness.Coche]
                      ? TextStyle(
                          color: Colors.green,
                        )
                      : TextStyle(
                          color: Colors.grey,
                        ),
                ),
                Checkbox(
                  activeColor: Colors.green,
                  value: _opcionCheckbox[RadioOpcioness.Coche],
                  onChanged: (value) {
                    setState(() {
                      _opcionCheckbox[RadioOpcioness.Coche] = value;
                    });
                  },
                ),
                Text(
                  'avion',
                  style: _opcionCheckbox[RadioOpcioness.Avion]
                      ? TextStyle(
                          color: Colors.green,
                        )
                      : TextStyle(
                          color: Colors.grey,
                        ),
                ),
                Checkbox(
                  activeColor: Colors.green,
                  value: _opcionCheckbox[RadioOpcioness.Avion],
                  onChanged: (value) {
                    setState(() {
                      _opcionCheckbox[RadioOpcioness.Avion] = value;
                    });
                  },
                ),
                Text(
                  'Barco',
                  style: _opcionCheckbox[RadioOpcioness.Barco]
                      ? TextStyle(
                          color: Colors.green,
                        )
                      : TextStyle(
                          color: Colors.grey,
                        ),
                ),
                Checkbox(
                  value: _opcionCheckbox[RadioOpcioness.Barco],
                  onChanged: (value) {
                    setState(() {
                      _opcionCheckbox[RadioOpcioness.Barco] = value;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.directions_car,
                  color: _opcionCheckbox[RadioOpcioness.Coche]
                      ? Colors.green
                      : Colors.grey,
                ),
                Icon(
                  Icons.airplanemode_active,
                  color: _opcionCheckbox[RadioOpcioness.Avion]
                      ? Colors.green
                      : Colors.grey,
                ),
                Icon(
                  Icons.directions_boat,
                  color: _opcionCheckbox[RadioOpcioness.Barco]
                      ? Colors.green
                      : Colors.grey,
                ),
              ],
            ),
            Divider(),
            Text(
              'Slider',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Slider(
              min: 0,
              max: 10,
              divisions: 10,
              // label: '$_opcionSlider',//no se para que sirve
              activeColor: Colors.red,
              thumbColor: Colors.black,
              inactiveColor: Colors.amber,
              value: _opcionSlider,
              onChanged: (value) {
                setState(() {
                  _opcionSlider = value;
                });
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: CupertinoSlider(
                min: 0,
                max: 10,
                divisions: 10,
                activeColor: Colors.green,
                thumbColor: Colors.black,
                value: _opcionSlider,
                onChanged: (value) {
                  setState(() {
                    _opcionSlider = value;
                  });
                },
              ),
            ),
            Text(
              'Elvalor del slider es: ${_opcionSlider}',
              style: TextStyle(
                color: _opcionSlider < 5 ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum RadioOpcioness { Coche, Avion, Barco }
