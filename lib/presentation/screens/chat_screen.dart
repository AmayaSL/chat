import 'package:chat/entities/message.dart';
import 'package:chat/presentation/widgets/message_field.dart';
import 'package:chat/presentation/widgets/my_message.dart';
import 'package:chat/presentation/widgets/you_message.dart';
import 'package:chat/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://st.depositphotos.com/66614570/57583/v/450/depositphotos_575834590-stock-illustration-cute-astronaut-themed-vector-design.jpg'),
          ),
        ),
        title: const Text('Chat Temporal'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScroll,
                    itemCount: chatProvider.message.length,
                    itemBuilder: (context, index) {
                      final menssage = chatProvider.message[index];
                      return (menssage.from == FromWho.mine)
                          ? MyMessage(message: menssage)
                          : YouMessage(message: menssage);
                    })),
            MessageField(onValue: chatProvider.sendMessage)
          ],
        ),
      ),
    );
  }
}
