import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) {
    return YesNoModel(
      answer: json['answer'] as String,
      forced: json['forced'] as bool,
      image: json['image'] as String,
    );
  }

  //Generalmente esta en un archivo independiente
  Message toMessageEntity() {
    return Message(
      text: answer == 'yes' ? 'Sí' : 'No',
      imageUrl: image,
      fromWho: FromWho.hers,
    );
  }
}
