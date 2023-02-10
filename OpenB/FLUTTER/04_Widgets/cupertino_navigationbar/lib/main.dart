import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

//stateless no guarda info de estado
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScaffoldApp', //el que aparece en el menu de apps
      debugShowCheckedModeBanner: false, //quita la cinta de debug
      home: MyHomePage(title: 'ScaffoldApp Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext contect) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Aplicación barra de navegación',
              style: TextStyle(decoration: TextDecoration.none, fontSize: 20),
            ),
          ],
        ),
      ),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        middle: Text(
          'Titulo de pagina',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
    );
  }
}
