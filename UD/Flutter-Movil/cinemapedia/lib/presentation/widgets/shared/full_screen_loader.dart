import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> messagesStream() {
    final messages = [
      'Cargando información...',
      'Espere por favor',
      'Estamos preparando todo para usted',
      'Un momento, por favor',
      'Ya mero carga :c',
      'Esto esta tardando mas de lo esperado, pero valdrá la pena :D',
    ];
    return Stream.periodic(const Duration(seconds: 2), (count) {
      if (count < messages.length) {
        return messages[count];
      } else {
        return messages.last;
      }
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: messagesStream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text('Cargando información...');
              }
              return Center(child: Text(snapshot.data!, textAlign: .center));
            },
          ),
        ],
      ),
    );
  }
}
