import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';

Widget buildCategory(String text, BuildContext context, {bool isSelected = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: isSelected ? context.colors.baseColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        child: Text(
          text,
          style: MyFonts.styleBold700_16.copyWith(
            color: isSelected ? context.colors.white : context.colors.iconsColor,
          ),
        ),
      ),
    ),
  );
}
