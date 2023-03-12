import 'package:flutter/material.dart';
import 'package:http_get_request/helpers/item_request.dart';
import 'package:http_get_request/widget/request_widget.dart';

// url de prueba: https://jsonplaceholder.typicode.com/posts/10

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final req = RequestItem(url: url);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: HTTPWidget(req),
        ),
      ),
    );
  }
}
