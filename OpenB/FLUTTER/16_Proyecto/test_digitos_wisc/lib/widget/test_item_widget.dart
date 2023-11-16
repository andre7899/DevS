import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_digitos_wisc/services/test_service.dart';

class TestItem extends StatelessWidget {
  TestItem(this._snapshot, {super.key})
      : codigo = _snapshot.get('COD'),
        puntuacionDirecta = _snapshot.get('Dd'),
        puntuacionDirectaSpan = _snapshot.get('SpanDd'),
        puntuacionInverso = _snapshot.get('Di'),
        puntuacionInversoSpan = _snapshot.get('SpanDi'),
        puntuacionCreciente = _snapshot.get('Dc'),
        puntuacionCrecienteSpan = _snapshot.get('SpanDc');

  String codigo;
  int puntuacionDirecta;
  int puntuacionDirectaSpan;
  int puntuacionInverso;
  int puntuacionInversoSpan;
  int puntuacionCreciente;
  int puntuacionCrecienteSpan;

  final QueryDocumentSnapshot _snapshot;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(codigo),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Test $codigo'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Puntuación directa : $puntuacionDirecta'),
                        Text('Span directa : $puntuacionDirectaSpan'),
                        Text('Puntuación inversa : $puntuacionInverso'),
                        Text('Span inversa : $puntuacionInversoSpan'),
                        Text('Puntuación creciente : $puntuacionCreciente'),
                        Text('Span creciente : $puntuacionCrecienteSpan'),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.remove_red_eye_sharp),
          ),
          IconButton(
              onPressed: () {
                TestServices().deleteTest(codigo);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
