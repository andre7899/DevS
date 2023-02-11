import 'package:flutter/material.dart';
import 'package:listview_example/comidas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComidasApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Comidas Home'),
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
  final List _comidas = [
    Comida(
        'aceitunas', 'Entrante', Image.asset('Assets/Images/aceitunas.jfif')),
    Comida('atun', 'Entrante', Image.asset('Assets/Images/atun.jfif')),
    Comida('bizcocho', 'Entrante', Image.asset('Assets/Images/bizcocho.jfif')),
    Comida(
        'costillar', 'Entrante', Image.asset('Assets/Images/costillar.jfif')),
    Comida('crepe', 'Entrante', Image.asset('Assets/Images/crepe.jfif')),
    Comida('durum', 'Entrante', Image.asset('Assets/Images/durum.jfif')),
    Comida('hamburguesa', 'Entrante',
        Image.asset('Assets/Images/hamburguesa.jpg')),
    Comida('pizza', 'Entrante', Image.asset('Assets/Images/pizza.jfif')),
    Comida('salmon', 'Entrante', Image.asset('Assets/Images/salmon.jfif')),
    Comida('sandwich', 'Entrante', Image.asset('Assets/Images/sandwich.jfif')),
    Comida('sardinas', 'Entrante', Image.asset('Assets/Images/sardinas.jfif')),
    Comida(
        'solomillo', 'Entrante', Image.asset('Assets/Images/solomillo.jfif')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _comidas.length,
        itemBuilder: (context, index) {
          final item = _comidas[index];
          return ListTile(
            title: Text(
              '${item.nombre}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                  fontSize: 20),
            ),
            subtitle: Text(
              '${item.categoria}',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    alignment: Alignment.bottomLeft, //agregado mio
                    title: Text(
                      '${item.nombre}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                          fontSize: 20),
                    ),
                    content: item.image,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
