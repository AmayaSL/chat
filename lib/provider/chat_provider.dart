import 'package:chat/entities/message.dart';
import 'package:chat/helpers/get_answer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final res = GetAnswer();
  final chatScroll = ScrollController();
  List<Message> message = [
    Message(
        text: "has una pregunta",
        from: FromWho.your,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV3rX1fEQCvLtQa4okNTOCMmrijpM-dcysAw&s'),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      return;
    }

    final newMessage = Message(text: text, from: FromWho.mine);
    message.add(newMessage);
    final response = await res.getAnswers();
    message.add(response);

    res.getAnswers();

    notifyListeners();

    moveScroll();
  }

  void moveScroll() {
    chatScroll.animateTo(chatScroll.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
