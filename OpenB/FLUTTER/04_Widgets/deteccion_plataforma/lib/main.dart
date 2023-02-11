import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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
  Icon _corazon = const Icon(
    Icons.favorite_border,
    color: Colors.white,
  );
  bool _liked = false;
  int elementoSelecionado = 0;
  String textoAVisualizar = '0: Home';

  @override
  Widget build(BuildContext context) {
    return Platform.isWindows ? cupertino() : material();
  }

  Widget material() {
    return Scaffold(
      //parte superior
      appBar: AppBar(
        title: (Text(widget.title!)),
        actions: [
          IconButton(
              onPressed: () {
                _likedChange();
              },
              icon: _corazon)
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            DrawerHeader(
                child: Text(
              'Menu Drawer',
              style: TextStyle(
                color: Colors.red,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )),
            Text('Enlace 1'),
            Text('Enlace 2'),
            Text('Enlace 3'),
          ],
        ),
      ),

      body: Center(
        //centro en la horizontal
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //centro en la vertical
          children: [
            Text(
              textoAVisualizar,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _likedChange();
        },
        backgroundColor: Colors.red,
        child: _corazon,
        // label: Text('Like'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              label: 'Mi cuenta'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.assessment,
                color: Colors.white,
              ),
              label: 'Estadisticas'),
        ],
        currentIndex: elementoSelecionado,
        onTap: _itemPulsado,
      ),
    );
  }

  Widget cupertino() {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              label: 'Mi cuenta',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                  color: Colors.white,
                ),
                label: 'Estadisticas')
          ],
          backgroundColor: Colors.red,
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                      child: Center(
                    child: Column(
                      children: [Text('$index: Inicio')],
                    ),
                  ));
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                      child: Center(
                    child: Column(
                      children: [Text('$index: Mi cuenta')],
                    ),
                  ));
                },
              );
            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                      child: Center(
                    child: Column(
                      children: [Text('$index: Estadistica')],
                    ),
                  ));
                },
              );
            default:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                      child: Center(
                    child: Column(
                      children: [Text('$index: Home')],
                    ),
                  ));
                },
              );
          }
        });
  }

  _likedChange() {
    //set state cambia la pantalla
    setState(() {
      if (_liked) {
        _corazon = const Icon(
          Icons.favorite_border,
          color: Colors.white,
        );
        _liked = false;
      } else {
        _corazon = const Icon(
          Icons.favorite,
          color: Colors.white,
        );
        _liked = true;
      }
    });
  }

  void _itemPulsado(int index) {
    setState(() {
      elementoSelecionado = index;
      switch (elementoSelecionado) {
        case 0:
          textoAVisualizar = '$elementoSelecionado: Home';
          break;
        case 1:
          textoAVisualizar = '$elementoSelecionado: Mi cuenta';
          break;
        case 2:
          textoAVisualizar = '$elementoSelecionado: Estadisticas';
          break;
      }
    });
  }
}
