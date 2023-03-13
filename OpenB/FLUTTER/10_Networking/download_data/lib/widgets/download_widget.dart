import 'package:download_data/providers/progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DownloadWidget extends StatelessWidget {
  const DownloadWidget({super.key});

  final String url =
      'http://luisgarciamillan.es/wp-content/uploads/2021/01/Sistemas-de-Telecomunicaci%C3%B3n.pdf';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<DownloadProgress>(
        builder: (context, value, child) {
          var progress = value.progress.toStringAsFixed(2);

          return ElevatedButton(
              onPressed: () =>
                  value.start(url: url, filenamePath: 'prueba_pdf1.pdf'),
              child: Text('${value.progress.toStringAsFixed(2)}%'));
        },
      ),
    );
  }
}
