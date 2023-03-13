import 'package:download_data/providers/progress.dart';
import 'package:download_data/widgets/download_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Descarga PDF',
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => DownloadProgress(),
          child: Center(
            child: DownloadWidget(),
          ),
        ),
      ),
    );
  }
}
