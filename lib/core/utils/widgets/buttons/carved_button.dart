import 'package:flutter/material.dart';

import '../../../styles/colors/my_colors.dart';
import '../../../styles/fonts/my_fonts.dart';


class CurvedButton extends StatelessWidget {
  const CurvedButton({
    super.key,
     this.color,
    required this.title,
    required this.onTap,
    this.height,
    this.width,
    this.colorBorderSide,
    this.textColor, this.style,
  });

  final Color? color;
  final String title;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? colorBorderSide;
  final Color? textColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??50,
      width: width??double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor:color ?? MyColors.baseColor ,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: colorBorderSide ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          title,
          style: style ?? MyFonts.styleMedium500_16
              .copyWith(color: textColor ?? MyColors.white),
        ),
      ),
    );
  }
}
