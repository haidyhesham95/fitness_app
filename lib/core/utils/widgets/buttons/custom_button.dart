import 'package:flutter/material.dart';
import '../../../styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.txt,
    this.height,
    this.width,
    this.color,
    required this.onPressed,
  });

  final String txt;
  final double? height;
  final double? width;
  final Color? color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          animationDuration: const Duration(milliseconds: 200),
          backgroundColor: WidgetStatePropertyAll<Color>(color??context.colors.baseColor),
          shape: WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color:  context.colors.baseColor)))),
      child: SizedBox(
        height: height ?? 38.h,
        width: width ?? double.infinity,
        child: Center(
          child: Text(
            txt,
            style: MyFonts.styleExtraBold800_14
                .copyWith(color: context.colors.white),
          ),
        ),
      ),
    );
  }
}
