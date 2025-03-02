import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class SmartChatList extends StatelessWidget {
  final List<SmartChatResponseEntity> messages;

  const SmartChatList({Key? key, required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return message.isUser
            ? FadeInRight(
                duration: Duration(milliseconds: 100 * index),
                child: ChatBubble(message: message))
            : FadeInLeft(
                duration: Duration(milliseconds: 200 * index),
                child: ChatBubble(message: message));
      },
    );
  }
}
