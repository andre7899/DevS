import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_digitos_wisc/firebase_options.dart';
import 'package:test_digitos_wisc/providers/testprovider.dart';
import 'package:test_digitos_wisc/screens/test_screen.dart';
import 'package:test_digitos_wisc/services/test_service.dart';
import 'package:test_digitos_wisc/widget/test_item_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CustomTestProvider(),
      child: MaterialApp(
        title: 'Test Digitos Wisc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Página principal'),
      ),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: TestServices().getStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error de Conexion');
          }
          if (snapshot.hasData) {
            final data = snapshot.data;
            if (data != null) {
              return ListView.builder(
                itemExtent: 60,
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return TestItem(data.docs[index]);
                },
              );
            }
          }
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TestScreen(),
          ));
        },
        tooltip: 'Nuevo Test',
        child: const Icon(Icons.add),
      ),
    );
  }
}
