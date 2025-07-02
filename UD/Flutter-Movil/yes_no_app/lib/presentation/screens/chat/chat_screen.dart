import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/hermessage_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

//! Si el nombre lleva screen, acostumbrar usar scaffold
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.cambridge.org/elt/blog/wp-content/uploads/2020/08/GettyImages-1221348467-e1597069527719.jpg'),
          ),
        ),
        title: const Text('Mi bot 😦'),
        centerTitle: true,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  controller: chatProvider.chatScrollController,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messages[index];
                    return message.fromWho == FromWho.me
                        ? MyMessageBubble(
                            message: message.text,
                          )
                        : HerMessageBubble(
                            message: message.text,
                            imageUrl: message.imageUrl,
                          );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: chatProvider.messages.length),
            ),
            const SizedBox(
              height: 5,
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
