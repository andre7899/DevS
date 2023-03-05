import 'package:flutter/material.dart';
import 'package:inkwell_example/comidas.dart';

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
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: Key(
                item.nombre), //identificador, que sea unico en los elementos
            background: Container(
              // alignment: Alignment.centerLeft,
              child: Icon(
                Icons.delete,
                size: 40,
                color: Colors.white,
              ),
              color: Colors.red,
            ),
            onDismissed: (direction) {
              setState(() {
                _comidas.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${item.nombre} ha sido borrado!'),
                ));
              });
            },

            child: Card(
              color: Colors.grey[200],
              elevation: 5,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyan[900]!,
                      blurRadius: 10,
                      offset: Offset(-15, 33),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Colors.cyan[100]!,
                      Colors.cyan[600]!,
                    ],
                  ),
                ),
                // color: Colors.green,
                child: InkWell(
                  enableFeedback: true,
                  autofocus: true,

                  // focusColor: Colors.green,
                  // highlightColor: Colors.red,
                  // hoverColor: Colors.purple,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${item.nombre}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        '${item.categoria}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.yellow,
                          title: Text(
                            '${item.nombre}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          content: item.image,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
