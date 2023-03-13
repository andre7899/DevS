import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:provider_example/main.dart';

void main() {
  enableFlutterDriverExtension(); //encendemos modo de testeo 'debug'
  runApp(MyApp());
}
