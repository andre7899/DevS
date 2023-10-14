import 'package:example_responsive/responsive/desktop_body.dart';
import 'package:example_responsive/responsive/mobile_body.dart';
import 'package:example_responsive/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MyMobileBody(),
      desktopBody: MyDesktopBody(),
    );
  }
}
