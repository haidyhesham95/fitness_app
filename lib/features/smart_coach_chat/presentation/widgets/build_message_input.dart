// ignore: unused_import
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/custom_text_form_feild.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_action.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_state.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/assets.dart';

class BuildMessageInput extends StatefulWidget {

  const BuildMessageInput({Key? key, }) : super(key: key);

  @override
  State<BuildMessageInput> createState() => _BuildMessageInputState();
}

class _BuildMessageInputState extends State<BuildMessageInput> {
  final TextEditingController promptController = TextEditingController();

  void _sendMessage() {

    if (promptController.text.isEmpty) return;

    context.read<SmartChatViewModel>().doAction(
      SendMessageAction(promptController.text, Assets.imagesUser),
    );
    promptController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmartChatViewModel, SmartChatState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: promptController, hintTxt: 'Type a message...',
                  onFieldSubmitted: (_) => _sendMessage(),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => _sendMessage(),
                child:  CircleAvatar(
                  radius: 22,
                  backgroundColor: context.colors.baseColor,
                  child: Icon(Icons.send, color: context.colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
