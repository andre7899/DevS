import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fecha y hora App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fecha y hora'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', 'PE'),
      ],
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
  DateTime? _date = null;
  TimeOfDay? _time = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _seleccionarFecha,
              child: Text(
                'Introducir Fecha nacimiento',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                textStyle: TextStyle(
                  color: Colors.green, //no se para que es
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: _seleccionarHora,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                textStyle: TextStyle(
                  color: Colors.green, //no se para que es
                ),
              ),
              child: const Text(
                'Introducir Hora de nacimiento',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              'La fecha seleccionada es:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              _date == null
                  ? 'Ninguna fecha seleccionada'
                  : '${_date!.day}/${_date!.month}/${_date!.year}',
              style: _date == null
                  ? const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    )
                  : const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.red,
                    ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              'La hora seleccionada es:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              _time == null
                  ? 'Ninguna hora seleccionada'
                  : '${_time!.format(context)}',
              style: _time == null
                  ? const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    )
                  : const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.red,
                    ),
            ),
          ],
        ),
      ),
    );
  }

//SELECCION DE FECHA
  Future _seleccionarFecha() async {
    //puede ser nulable
    DateTime? _fechaSeleccionada = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: DateTime.now(),
        lastDate: DateTime.now());

    setState(() {
      if (_fechaSeleccionada != null) {
        _date = _fechaSeleccionada;
      }
    });
  }

  Future _seleccionarHora() async {
    TimeOfDay? _horaSeleccionada = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    setState(() {
      if (_horaSeleccionada != null) {
        _time = _horaSeleccionada;
      }
    });
  }
}
