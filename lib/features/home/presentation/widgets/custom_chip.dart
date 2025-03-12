import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/fonts/my_fonts.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key, required this.text, required this.txtColor});

  final String text;
  final Color txtColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: context.colors.darkGray,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.colors.darkGray),
        borderRadius: BorderRadius.circular(12),
      ),
      label: FittedBox(
        alignment: Alignment.center,
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: MyFonts.styleBold700_14.copyWith(
            color: txtColor,
          ),
        ),
      ),
    );
  }
}
