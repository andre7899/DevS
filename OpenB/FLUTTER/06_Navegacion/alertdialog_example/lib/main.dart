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
    return MaterialApp(
      title: 'SnackBarApp',
      home: MyHomePage(title: 'Ejemplo de SnackBar'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  // final SnackBar _snackBar = const SnackBar(
  //   content: Text('Ejemplo de texto en SnackBar'),
  //   duration: Duration(seconds: 4),
  //   backgroundColor: Colors.red,
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible:
                      false, //para no poder salir pulasndo fuera
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Titulo del AlertDialog'),
                      content: Text('Contenido del alert dialog'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            //HABLAMOS DE UNA VISTA QUE SE SUPERPONE A LA PANTALLA
                            Navigator.of(context).pop();
                          },
                          child: Text('Cerrar'),
                        )
                      ],
                    );
                  },
                );
              },
              child: Text('Abrir AlertDialog'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext) {
                      return CupertinoAlertDialog(
                        title: Text('Titulo CupertinoDaialog'),
                        content: Text('Contenido CupertinoDialog'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cerrarr')),
                        ],
                      );
                    },
                  );
                },
                child: Text('Abrir CupertinoDialog'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
