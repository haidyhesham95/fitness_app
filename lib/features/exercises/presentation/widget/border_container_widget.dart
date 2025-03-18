import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';

class BorderContainerWidget extends StatelessWidget {
  const BorderContainerWidget({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text,
          style: style ??
              MyFonts.styleRegular400_12.copyWith(color: context.colors.white)),
    );
  }
}
