import 'dart:io';

import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/custom_text_form_feild.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_action.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_state.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/widgets/menu_item_anchor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../generated/assets.dart';
import 'chat_image_widget.dart';

class BuildMessageInput extends StatefulWidget {
  const BuildMessageInput({Key? key}) : super(key: key);

  @override
  State<BuildMessageInput> createState() => _BuildMessageInputState();
}

class _BuildMessageInputState extends State<BuildMessageInput> {
  final TextEditingController promptController = TextEditingController();
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _deleteImage() {
    setState(() {
      _imageFile = null;
    });
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_imageFile != null)
                ChatImageWidget(
                  image: FileImage(_imageFile!),
                  onTap: _deleteImage,
                ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      prefixIcon: MenuItemAnchor(
                        onTapCamera: () => _pickImage(ImageSource.camera),
                        onTapGallery: () => _pickImage(ImageSource.gallery),
                      ),
                      prefixIconColor: context.colors.white,
                      controller: promptController,
                      hintTxt: 'Type a message...',
                      onFieldSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => _sendMessage(),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: context.colors.baseColor,
                      child: Icon(Icons.send, color: context.colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
