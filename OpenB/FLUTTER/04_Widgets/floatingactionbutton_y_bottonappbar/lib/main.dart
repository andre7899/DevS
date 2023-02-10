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
  Icon _corazon = const Icon(
    Icons.favorite_border,
    color: Colors.white,
  );
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _likedChange();
        },
        backgroundColor: Colors.red,
        child: _corazon,
        // label: Text('Like'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //parte de abajo
      bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          shape: CircularNotchedRectangle(),
          child: Container(
            // height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.camera_enhance,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )),
    );
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
}
