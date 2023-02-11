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
      title: 'texfield Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TextFields'),
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
  TextStyle style1 = TextStyle(color: Colors.white);

  TextStyle style2 =
      TextStyle(color: Colors.amber, fontWeight: FontWeight.bold);

  String _textoAlCambiar = 'Ningun texto introducido';
  String _textoEnviado = 'Ningun texto enviado';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Formulario :D',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      Text('Ingresa tu nombre..(creo que mejor va sin esto)'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Introduce tu nombre',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _textoAlCambiar = value;
                          });
                        },
                        onSubmitted: (value) {
                          setState(() {
                            _textoEnviado = value;
                          });
                        },
                        // obscureText: true,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.7,
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 25,
                        spreadRadius: 25,
                        offset: Offset(0, 15),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
                      Text(
                        '1. Texto que se esta introduciendo en directo',
                        style: style2,
                      ),
                      Text(
                        '$_textoAlCambiar',
                        style: style1,
                      ),
                      Text(
                        '1. Texto que se ha enviado',
                        style: style2,
                      ),
                      Text(
                        '$_textoEnviado',
                        style: style1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
