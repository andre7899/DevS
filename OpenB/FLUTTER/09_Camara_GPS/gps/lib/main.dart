import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gps(tituto)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'App GPS'),
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
  Location _location = Location();
  LocationData? _locationData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //La accion no se hace inmediatamente ya que es un Future
    _encontrarLocalizacion();
  }

  Future _encontrarLocalizacion() async {
    try {
      _locationData = await _location.getLocation();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Posicion actual'),
            Text(_locationData == null
                ? 'No hay localizacion'
                : 'latitud: ${_locationData!.latitude} y Longitud: ${_locationData!.longitude}'),
          ],
        ),
      ),
    );
  }
}
