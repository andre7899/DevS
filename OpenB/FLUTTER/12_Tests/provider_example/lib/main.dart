import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/contador_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProviderApp',
      //linea de provider
      home: ChangeNotifierProvider(
        create: (_) => ContadorProvider(0),
        child: MyHomePage(title: 'Provider App--'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final _counterprovider = Provider.of<ContadorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Has presionado el boton esta cantidad de veces'),
            Text(
              '${_counterprovider.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
              key: Key('countertext'),
            ),
            IconButton(
                onPressed: _counterprovider.decrement,
                icon: Icon(Icons.minimize)),
            TextField(
              key: Key('textfield'),
              decoration: InputDecoration(
                hintText: 'Ejemplo',
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterprovider.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        key: Key('increment'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
