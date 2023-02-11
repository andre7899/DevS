import 'package:flutter/material.dart';
import 'package:gridview_example/comidas.dart';

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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //3 columnas
        ),
        itemCount: _comidas.length,
        itemBuilder: (context, index) {
          final item = _comidas.elementAt(index);
          return Card(
            color: Colors.cyan,
            elevation: 5,
            child: GestureDetector(
              // para dar funcionalidad al boton
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Hola'),
                  ),
                );
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 80,
                      child: item.image,
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Text(
                      '${item.nombre}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${item.categoria}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

          // GridTileBar(
          //   backgroundColor: Colors.cyan,
          //   title: Container(
          //     child: item.image,
          //   ),
          //   subtitle: Padding(
          //     padding: const EdgeInsets.only(top: 8),
          //     child: Text(
          //       '${item.nombre}',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 20,
          //       ),
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
