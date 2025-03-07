import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_action.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:isar/isar.dart';

import '../../../../core/styles/fonts/my_fonts.dart';

class CustomSavedMessage extends StatelessWidget {
  const CustomSavedMessage(
      {super.key, required this.text, required this.chatId});

  final String text;
  final Id chatId;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SmartChatViewModel>();
    final bool isSelected = viewModel.currentChatId == chatId;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back_ios_new_outlined,
                color: context.colors.baseColor),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  viewModel.currentChatId = chatId;
                  viewModel.doAction(GetChatAction(chatId));
                  Navigator.pop(context);
                },
                child: Text(
                  text,
                  style: MyFonts.styleMedium500_12.copyWith(
                    color: context.colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        Divider(color: context.colors.gray),
      ],
    );
  }
}
