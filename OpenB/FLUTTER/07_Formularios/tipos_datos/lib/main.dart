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
                    children: const [
                      Text('Introduce tu contraseña'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Introduce tu nombre',
                        ),
                        onChanged: null,
                        onSubmitted: null,
                        obscureText: true,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text('Introduce tu datetime'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Introduce tu nombre',
                        ),
                        onChanged: null,
                        onSubmitted: null,
                        // obscureText: true,
                        keyboardType: TextInputType.datetime,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text('Introduce tu email'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Introduce tu email',
                        ),
                        onChanged: null,
                        onSubmitted: null,
                        // obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text('Introduce tu multiline'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Introduce tu multiline',
                        ),
                        onChanged: null,
                        onSubmitted: null,
                        obscureText: true,
                        keyboardType: TextInputType.multiline,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text('Introduce tu numero'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Introduce tu numero',
                        ),
                        onChanged: null,
                        onSubmitted: null,
                        // obscureText: true,
                        keyboardType: TextInputType.number,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text('Introduce tu telefon'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Introduce tu teelfono',
                        ),
                        onChanged: null,
                        onSubmitted: null,
                        // obscureText: true,
                        keyboardType: TextInputType.phone,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text('Introduce tu URL'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Introduce tu URL',
                        ),
                        onChanged: null,
                        onSubmitted: null,
                        // obscureText: true,
                        keyboardType: TextInputType.url,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
