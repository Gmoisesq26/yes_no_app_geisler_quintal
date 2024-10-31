import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_geisler_quintal/domain/entities/message.dart';
import 'package:yes_no_app_geisler_quintal/main.dart';
import 'package:yes_no_app_geisler_quintal/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_geisler_quintal/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_geisler_quintal/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_geisler_quintal/presentation/widgets/chat/shared/message_field_box.dart';

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
                'https://i.pinimg.com/originals/43/c2/34/43c234a9c68a9175887621cb682428d1.png'),
          ),
        ),
        title: const Text('Mi amor ❤️'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

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
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.formWho == FromWho.hers)
                      ? const HerMessageBubble()
                      : MyMessageBubble(message: message);
                },
              ),
            ),

            /// caja de texto
            MessageFileBox(
              onValeu: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
