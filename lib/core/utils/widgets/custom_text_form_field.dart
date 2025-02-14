import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../styles/colors/my_colors.dart';
import '../../styles/fonts/my_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintTxt,
    this.prefixIcon,
    this.prefixImage,
    this.suffixIcon,
    this.controller,
    this.validator,
  });

  final String hintTxt;
  final IconData? prefixIcon;
  final String? prefixImage;
  final String? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        validator: validator,
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          errorStyle:  const TextStyle(
            height: 0.5,
          ),
          prefixIcon: prefixImage != null
              ? SvgPicture.asset(
                  prefixImage!,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
                  color: MyColors.iconsColor,
                )
              : (prefixIcon != null
                  ? Icon(prefixIcon, color: MyColors.iconsColor, size: 20)
                  : null),
          suffixIcon: suffixIcon != null
              ? SvgPicture.asset(
            suffixIcon!,
            width: 20.w,
            height: 20.h,
            fit: BoxFit.scaleDown,
            color: MyColors.iconsColor,
          )
              : (suffixIcon != null
              ? Icon(prefixIcon, color: MyColors.iconsColor, size: 20)
              : null),
          hintStyle: MyFonts.styleRegular400_16.copyWith(color: MyColors.iconsColor),
          hintText: hintTxt,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: MyColors.iconsColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: MyColors.iconsColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: MyColors.iconsColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: MyColors.iconsColor),
          ),
        ),
      ),
    );
  }
}
