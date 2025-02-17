import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../styles/fonts/my_fonts.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
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
        style:  TextStyle(
          color: context.colors.white
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          errorStyle:   const TextStyle(
            height: 0.5,
          ),
          prefixIcon: prefixImage != null
              ? SvgPicture.asset(
                  prefixImage!,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(context.colors.iconsColor, BlendMode.srcIn),
                )
              : (prefixIcon != null
                  ? Icon(prefixIcon, color: context.colors.iconsColor, size: 20)
                  : null),
          suffixIcon: suffixIcon != null
              ? SvgPicture.asset(
            suffixIcon!,
            width: 20.w,
            height: 20.h,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(context.colors.iconsColor, BlendMode.srcIn),
          )
              : (suffixIcon != null
              ? Icon(prefixIcon, color: context.colors.iconsColor, size: 20)
              : null),
          hintStyle: MyFonts.styleRegular400_16.copyWith(color: context.colors.iconsColor),
          hintText: hintTxt,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide:  BorderSide(color: context.colors.iconsColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide:  BorderSide(color: context.colors.iconsColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide:  BorderSide(color: context.colors.iconsColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide:  BorderSide(color: context.colors.iconsColor),
          ),
        ),
      ),
    );
  }
}
