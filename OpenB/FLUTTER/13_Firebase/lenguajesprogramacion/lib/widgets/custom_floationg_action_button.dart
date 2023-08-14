import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Añadir lenguaje'),
              content: TextField(
                controller: _controller,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      final nombre = _controller.text;
                      FirebaseFirestore.instance.collection('lenguajes').add({
                        'image': 'dart.png',
                        'votos': 16,
                        'nombre': nombre,
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Crear'))
              ],
            );
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
