import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/fonts/my_fonts.dart';

class CustomSavedMessage extends StatelessWidget {
  const CustomSavedMessage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back_ios_new_outlined,
                color: context.colors.baseColor),
            Expanded(
              child: Text(
                text,
                style: MyFonts.styleMedium500_12.copyWith(
                  color: context.colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Divider(color: context.colors.gray),
      ],
    );
  }
}
