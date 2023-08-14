import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lenguajesprogramacion/widgets/connection_error_widget.dart';
import 'package:lenguajesprogramacion/widgets/custom_floationg_action_button.dart';
import 'package:lenguajesprogramacion/widgets/languages_list_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return MaterialApp(
              home: Scaffold(
                  appBar: AppBar(
                    title: const Text('Lenaguajes progra'),
                  ),
                  body: const ConnectionError()),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return MaterialApp(
              title: 'Lenguajes programacion titulo',
              theme: ThemeData(
                
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const MyHomePage(title: 'page lengaujes programacion'),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_field
  // late final Future<FirebaseApp> _initialization;
  // @override
  // void initState() {
  //   super.initState();
  //   _initialization = Firebase.initializeApp();
  // }


  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: LanguagesListWidget(),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
