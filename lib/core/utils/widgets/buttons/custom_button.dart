import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles/colors/my_colors.dart';
import '../../../styles/fonts/my_fonts.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MyColors.baseColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          txt,
          style: MyFonts.styleExtraBold800_14.copyWith(color: MyColors.white),
        ),
      ),
    );
  }
}