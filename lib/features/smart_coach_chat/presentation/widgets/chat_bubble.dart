import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/custom_glassy_container.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/widgets/avatar_with_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  final SmartChatResponseEntity message;

  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isUser) AvatarWithShadow(imageUrl: message.senderImageUrl),
            horizontalSpacing(10.w),
            Flexible(
              child: Column(
                crossAxisAlignment:
                isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  // Display the image if it exists
                  if (message.imageFile != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          message.imageFile!,
                          width: 200.w, // Adjust the width as needed
                          height: 200.h, // Adjust the height as needed
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  // Display the text message
                  CustomGlassyContainer(
                    color: isUser ? context.colors.baseColor : Colors.black38,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15),
                      topRight: const Radius.circular(15),
                      bottomLeft: Radius.circular(isUser ? 15 : 0),
                      bottomRight: Radius.circular(isUser ? 0 : 15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        message.text,
                        style: MyFonts.styleRegular400_18.copyWith(
                          color: context.colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            horizontalSpacing(10.w),
            if (isUser) AvatarWithShadow(imageUrl: message.senderImageUrl),
          ],
        ),
      ),
    );
  }
}