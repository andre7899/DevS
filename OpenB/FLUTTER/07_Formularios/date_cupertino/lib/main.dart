import 'package:flutter/cupertino.dart';
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
        GlobalCupertinoLocalizations.delegate,
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
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      child: _displayCalendar(),
                      height: MediaQuery.of(context).size.height * 0.4,
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                textStyle: TextStyle(
                  color: Colors.green, //no se para que es
                ),
              ),
              child: const Text(
                'Introducir Fecha nacimiento',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      child: _displayClock(),
                      height: MediaQuery.of(context).size.height * 0.4,
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                textStyle: TextStyle(
                  color: Colors.green, //no se para que es
                ),
              ),
              child: const Text(
                'Introducir hora nacimiento',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            const Text(
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
            const Text(
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
          ],
        ),
      ),
    );
  }

  Widget _displayCalendar() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      maximumDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 23, 59),
      minimumDate: DateTime(1990),
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (value) {
        setState(() {
          _date = value;
        });
      },
    );
  }

  Widget _displayClock() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      maximumDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 23, 59),
      minimumDate: DateTime(1990),
      mode: CupertinoDatePickerMode.time,
      onDateTimeChanged: (value) {
        setState(() {
          _date = value;
        });
      },
    );
  }
}
