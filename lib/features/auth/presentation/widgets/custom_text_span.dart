import 'package:flutter/material.dart';
import 'package:fitness_app/core/styles/colors/my_colors.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';

class CustomTextSpanWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback? onTap;
  final TextStyle? normalTextStyle;
  final TextStyle? highlightedTextStyle;

  const CustomTextSpanWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
    this.normalTextStyle,
    this.highlightedTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: title,
            style: normalTextStyle ?? MyFonts.styleExtraBold800_14.copyWith(color: Colors.white),
            children: [
              WidgetSpan(
                child: GestureDetector(
                  onTap: onTap,
                  child: Text(
                    subTitle,
                    style: highlightedTextStyle ??
                        MyFonts.styleExtraBold800_14.copyWith(
                          color: MyColors.decorationUnderLineColor,
                          decoration: TextDecoration.underline,
                          decorationColor: MyColors.decorationUnderLineColor,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
