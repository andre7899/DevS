import 'package:flutter/material.dart';
import 'package:navegation/pantalla_2.dart';
import 'package:navegation/pantalla_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavigationApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pantalla_1'),
      //RUTAS DE LAS PAGINAS
      routes: <String, WidgetBuilder>{
        '/route1': (BuildContext context) => MyHomePage(
              title: 'Pagina1',
            ),
        '/route2': (BuildContext context) => Pantalla2(
              title: 'Pagina2',
            ),
        '/route3': (BuildContext context) => Pantalla3(
              title: 'Pagina3',
            ),
      },
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
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                //codigo para pasar a nueva pagina
                Navigator.pushNamed(context, '/route2');
              },
              child: Text('Cambiar a pantalla 2'),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                //codigo para pasar a nueva pagina
                Navigator.pushNamed(context, '/route3');
              },
              //Navigator.push{
              //  context,
              //  MaterialPageRoute(builder: (BuilContext context)=>
              //  Pantalla2(title: 'Pantalla 2'))}
              //
              child: Text('Cambiar a pantalla 3'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
