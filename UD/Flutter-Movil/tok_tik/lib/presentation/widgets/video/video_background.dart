import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  const VideoBackground(
      {super.key,
      this.colors = const [Colors.black, Colors.transparent],
      this.stops = const [0.5, 1.0]});

  final List<Color> colors;
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: DecoratedBox(
            decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: colors,
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: stops,
      ),
    )));
  }
}
