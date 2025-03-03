import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../styles/fonts/my_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintTxt,
    this.prefixText,
    this.prefixIcon,
    this.prefixImage,
    this.suffixIcon,
    this.controller,
    this.validator,
  });

  final String hintTxt;
  final String? prefixText;
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
        style: TextStyle(color: context.colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
          errorStyle: const TextStyle(height: 0.5),
          prefixIcon: prefixText != null || prefixIcon != null || prefixImage != null
              ? Padding(
            padding: EdgeInsets.only(left: 16.w, right: 8.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefixImage != null)
                  SvgPicture.asset(
                    prefixImage!,
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                        context.colors.iconsColor, BlendMode.srcIn),
                  ),
                if (prefixIcon != null)
                  Icon(prefixIcon, color: context.colors.iconsColor, size: 20),
                if (prefixText != null)
                  Text(
                    prefixText!,
                    style: MyFonts.styleBold700_12
                        .copyWith(color: context.colors.iconsColor),
                  ),
              ],
            ),
          )
              : null,
          prefixIconConstraints: BoxConstraints(
            minWidth: 40.w,
            minHeight: 40.h,
          ),

          suffixIcon: suffixIcon != null
              ? Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SvgPicture.asset(
              suffixIcon!,
              width: 20.w,
              height: 20.h,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                  context.colors.iconsColor, BlendMode.srcIn),
            ),
          )
              : null,
          hintStyle: MyFonts.styleRegular400_16.copyWith(color: context.colors.iconsColor),
          hintText: hintTxt,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: context.colors.iconsColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: context.colors.iconsColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: context.colors.iconsColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: context.colors.iconsColor),
          ),
        ),
      ),
    );
  }
}
