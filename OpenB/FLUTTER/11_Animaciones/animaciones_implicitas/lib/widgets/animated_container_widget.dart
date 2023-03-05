import 'package:animaciones_implicitas/providers/contador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedContainerWidget extends StatelessWidget {
  const AnimatedContainerWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContadorProvider>(
      builder: (context, status, _) {
        return Container(
          height: status.counter,
          width: status.counter,
          color: Colors.red,
          alignment: Alignment.center,
        );
      },
    );
  }
}
