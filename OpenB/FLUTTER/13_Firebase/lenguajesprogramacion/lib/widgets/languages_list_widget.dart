import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lenguajesprogramacion/widgets/connection_error_widget.dart';
import 'package:lenguajesprogramacion/widgets/language_item_widget.dart';

class LanguagesListWidget extends StatelessWidget {
  const LanguagesListWidget({super.key});
  static Stream<QuerySnapshot> getStream() => FirebaseFirestore.instance
      .collection('lenguajes')
      .orderBy('votos')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getStream(),
      builder: (context, languages) {
        if (languages.hasError) {
          return const ConnectionError();
        }
        if (languages.hasData) {
          final data = languages.data;
          if (data != null) {
            return ListView.builder(
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                return LanguageItem(data.docs[index]);
              },
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
