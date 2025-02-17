<<<<<<< HEAD
import 'package:flutter/material.dart';
import '../../../styles/colors/my_colors.dart';
import '../../../styles/fonts/my_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.txt, this.onTap});
  final String txt;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: MyColors.baseColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            txt,
            style: MyFonts.styleExtraBold800_14.copyWith(color: MyColors.white),
=======
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.txt,
    this.height,
    required this.width,
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
        width: width,
        child: Center(
          child: Text(
            txt,
            style: MyFonts.styleExtraBold800_14
                .copyWith(color: context.colors.white),
>>>>>>> development
          ),
        ),
      ),
    );
  }
}
