import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_digitos_wisc/models/sujeto.dart';

class TestServices {
  void addTest(Sujeto sujeto) {
    FirebaseFirestore.instance.collection('tests').add({
      'COD': sujeto.codigo,
      'Dd': sujeto.puntuacionDirecta,
      'SpanDd': sujeto.puntuacionDirectaSpan,
      'Di': sujeto.puntuacionInverso,
      'SpanDi': sujeto.puntuacionInversoSpan,
      'Dc': sujeto.puntuacionCrecienteSpan,
      'SpanDc': sujeto.puntuacionCrecienteSpan,
      'fecha': sujeto.fecha
    });
  }

  Stream<QuerySnapshot> getStream() => FirebaseFirestore.instance
      .collection('tests')
      .orderBy('fecha', descending: true)
      .snapshots();

  void deleteTest(String codigo) async {
    var collection = FirebaseFirestore.instance.collection('tests');
    var snapshot = await collection.where('COD', isEqualTo: codigo).get();
    await snapshot.docs.first.reference.delete();
  }
}
