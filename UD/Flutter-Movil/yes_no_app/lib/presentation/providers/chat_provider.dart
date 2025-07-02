import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hola bot!', fromWho: FromWho.me),
    Message(text: 'ya regresaste??', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    messages.add(Message(text: text, fromWho: FromWho.me));

    if (text.endsWith('?')) herReplay();

    notifyListeners();
    moveScrollToBottom();

    // Simulate a response from the bot
    // await Future.delayed(const Duration(seconds: 1));
    // messages
    //     .add(Message(text: 'No lo sé, ¿tú qué crees?', fromWho: FromWho.hers));
    // notifyListeners();
  }

  Future<void> herReplay() async {
    final HerMessage = await getYesNoAnswer.getAnswer();
    messages.add(HerMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }
}
