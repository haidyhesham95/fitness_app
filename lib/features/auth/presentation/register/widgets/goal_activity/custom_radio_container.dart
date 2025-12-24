import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import '../../../../../../../core/styles/fonts/my_fonts.dart';

class CustomContainerGoal extends StatelessWidget {
  const CustomContainerGoal({
    super.key,
    required this.txt,
    required this.keyValue,
  });

  final String txt;
  final String keyValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: context.colors.white),
      ),
      child: RadioListTile<String>(
        title: Text(
          txt,
          style: MyFonts.styleBold700_12.copyWith(color: context.colors.gray),
        ),
        value: keyValue, // ✅ فقط
        activeColor: context.colors.gray,
        controlAffinity: ListTileControlAffinity.trailing,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
