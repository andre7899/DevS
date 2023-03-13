import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownloadProgress extends ChangeNotifier {
  double _progress = 0;

  double get progress => this._progress;

  set progress(double value) => this._progress = value;

  void start({required String url, required String filenamePath}) async {
    _reset();

    final Directory? directories = await getExternalStorageDirectory();
    final finalPath = '${directories!.path}/$filenamePath';

    print(finalPath);

    //Download
    await Dio().download(
      url,
      finalPath,
      options: Options(
        headers: {
          HttpHeaders.acceptEncodingHeader:
              '*' //Me acepte cualquier tiepo de codificacion
        },
      ),
      onReceiveProgress: (count, total) {
        if (total != -1) {
          var pos = count / total * 100;
          //actualizar porcentaje
          _updateProgress(pos);
        }
      },
    );
  }

  void _updateProgress(double valor) {
    _progress = valor;
    notifyListeners();
  }

  void _reset() {
    if (_progress != 0) {
      _progress = 0;
      notifyListeners();
    }
  }
}
