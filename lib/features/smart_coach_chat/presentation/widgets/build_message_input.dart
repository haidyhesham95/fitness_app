import 'dart:io';

import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/custom_text_form_feild.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_action.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_state.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../generated/assets.dart';

class BuildMessageInput extends StatefulWidget {
  const BuildMessageInput({Key? key}) : super(key: key);

  @override
  State<BuildMessageInput> createState() => _BuildMessageInputState();
}

class _BuildMessageInputState extends State<BuildMessageInput> {
  final TextEditingController promptController = TextEditingController();
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _sendMessage() {
    if (promptController.text.isEmpty && _imageFile == null) return;

    context.read<SmartChatViewModel>().doAction(
          SendMessageAction(
              promptController.text, Assets.imagesUser, _imageFile),
        );
    promptController.clear();
    setState(() {
      _imageFile = null;
    });
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
                  suffixIcon: GestureDetector(
                    onTap: () => _sendMessage(),
                    child: Icon(Icons.send, color: context.colors.white),
                  ),
                  controller: promptController,
                  hintTxt: 'Type a message...',
                  onFieldSubmitted: (_) => _sendMessage(),
                ),
              ),
              const SizedBox(width: 10),
              _imageFile == null
                  ? GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: context.colors.baseColor,
                        child: Icon(Icons.image, color: context.colors.white),
                      ),
                    )
                  : ClipRRect(
                   borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                        _imageFile!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
