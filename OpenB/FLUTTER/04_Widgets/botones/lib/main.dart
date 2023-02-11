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
    return const MaterialApp(
      title: 'Botones App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Botones'),
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
  String botonPulsado = 'Ninguno';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _floatinPulsado,
        tooltip: 'Púlsame xd',
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('El boton pulsado es: '),
            Text(
              botonPulsado,
              style: TextStyle(
                  color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: _elevatedButtomPulsado,
              child: Text('Elevated buttom'),
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  primary: Colors.brown,
                  shadowColor: Colors.amberAccent),
            ),
            Padding(padding: EdgeInsets.all(5)),
            TextButton(
              onPressed: _textButtomPulsado,
              child: Text(
                'text Buttom',
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            IconButton(
              onPressed: _iconButtomPulsado,
              icon: Icon(Icons.accessibility),
              color: Colors.blue,
            ),
            Padding(padding: EdgeInsets.all(5)),
            Ink(
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.lightBlue,
              ),
              child: IconButton(
                onPressed: _iconButtomPulsado,
                icon: Icon(
                  Icons.accessibility,
                  color: Colors.white,
                ),
                iconSize: 50,
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            OutlinedButton(
              onPressed: _outLineButtom,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 4,
                  color: Colors.purple,
                  style: BorderStyle.solid,
                ),
              ),
              child: Text(
                'Out line butomm',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            CupertinoButton(
              onPressed: _cupertinoButtom,
              child: Text(
                'Cupertino Buttom',
              ),
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }

  void _elevatedButtomPulsado() {
    _queBoton('ele');
  }

  void _floatinPulsado() {
    _queBoton('flo');
  }

  void _textButtomPulsado() {
    _queBoton('tex');
  }

  void _iconButtomPulsado() {
    _queBoton('ico');
  }

  void _outLineButtom() {
    _queBoton('olb');
  }

  void _cupertinoButtom() {
    _queBoton('cub');
  }

  void _queBoton(String boton) {
    //NO OLVIDAR EL SETSTATE!!
    setState(() {
      switch (boton) {
        case 'flo':
          botonPulsado = 'Floating action buttom';
          break;
        case 'ele':
          botonPulsado = 'Elevated buttom';
          break;
        case 'tex':
          botonPulsado = 'text Buttom';
          break;
        case 'ico':
          botonPulsado = 'icon Buttom Pulsado';
          break;
        case 'olb':
          botonPulsado = 'Out line buttom';
          break;
        case 'cub':
          botonPulsado = 'cupertino Buttom';
      }
    });
  }
}
