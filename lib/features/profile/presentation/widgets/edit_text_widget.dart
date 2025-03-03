import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
class EditTextWidget extends StatelessWidget {
  final String mainText;
  final String editableText;
  final Color mainTextColor;
  final Color parenthesisColor;
  final Color editableTextColor;
  const EditTextWidget({
    super.key,
    required this.mainText,
    required this.editableText,
    required this.mainTextColor,
    required this.parenthesisColor,
    required this.editableTextColor,
  });
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: mainText,
            style: MyFonts.styleSemiBold600_16.copyWith(
              color: mainTextColor,
            ),
          ),
          TextSpan(
            text: '(',
            style: MyFonts.styleSemiBold600_16.copyWith(
              color: parenthesisColor,
            ),
          ),
          TextSpan(
            text: editableText,
            style:MyFonts.styleSemiBold600_16.copyWith(
              color: editableTextColor,
            ),
          ),
          TextSpan(
            text: ')',
            style: MyFonts.styleSemiBold600_16.copyWith(
              color: parenthesisColor,
            ),
          ),
        ],
      ),
    );
  }
}
