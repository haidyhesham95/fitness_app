import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import '../../styles/fonts/my_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintTxt,
      this.controller,
      this.validator,
      this.suffixIcon,
      this.isPassword,
      this.onFieldSubmitted
      , this.prefixIcon , this.prefixIconColor});

  final String hintTxt;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon , prefixIcon;
  final bool? isPassword;
  final void Function(String)? onFieldSubmitted;
  final Color? prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        obscureText: isPassword ?? false,
        cursorColor: context.colors.baseColor,
        style: const TextStyle(color: Colors.white),
        validator: validator,
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          suffixIcon: suffixIcon ?? null,
          contentPadding: EdgeInsets.zero,
          prefixIcon: prefixIcon ?? null,
          prefixIconColor: prefixIconColor ?? context.colors.gray,
          hintStyle:
              MyFonts.styleRegular400_12.copyWith(color: context.colors.gray),
          hintText: hintTxt,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.white),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
