import 'package:chat/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: "has una pregunta", from: FromWho.your),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      return;
    }

    final newMessage = Message(text: text, from: FromWho.mine);
    message.add(newMessage);
    notifyListeners();
  }
}
