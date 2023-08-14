import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {
  LanguageItem(QueryDocumentSnapshot snapshot, {super.key})
      : nombre = snapshot.get('nombre') as String,
        votos = snapshot.get('votos') as int,
        imagen = snapshot.get('image') as String;

  final String nombre;
  final int votos;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/$imagen'),
      title: Text(nombre),
      subtitle: Text('El numero de votos es: $votos'),
      
    );
  }
}
