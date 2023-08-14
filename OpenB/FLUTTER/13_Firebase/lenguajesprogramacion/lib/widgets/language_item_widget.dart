import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {
  LanguageItem(this._snapshot, {super.key})
      : nombre = _snapshot.get('nombre') as String,
        votos = _snapshot.get('votos') as int,
        imagen = _snapshot.get('image') as String;

  final String nombre;
  final int votos;
  final String imagen;
  final QueryDocumentSnapshot _snapshot;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/$imagen',width: 50,),
      title: Text(nombre),
      subtitle: Text('El numero de votos es: $votos'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: _addVoto,
            icon: const Icon(Icons.thumb_up),
            iconSize: 30,
            color: Colors.blue,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('¿De verdad quieres borrar $nombre?'),
                    actions: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancelar')),
                      FilledButton(
                        onPressed: _rmvLanguage,
                        child: Text('Aceptar'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete,color: Colors.red,),
            iconSize: 30,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  void _rmvLanguage() {
    FirebaseFirestore.instance.collection('lenguajes').doc(_snapshot.id).delete();
    
  }

  void _addVoto() {
    
    //transacciones se usan para editar variables
    FirebaseFirestore.instance.runTransaction((transaction) async {
      final securoSnapshot = await transaction.get(_snapshot.reference);
      final currentVotos =
          securoSnapshot.get('votos') as int; //tbm puede ser con _snapshot
          
      transaction.update(
        securoSnapshot.reference,
        {'votos': currentVotos + 1},
      );
    });
  }
}
