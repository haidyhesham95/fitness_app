import 'package:flutter/material.dart';

import '../../styles/colors/my_colors.dart';
import '../../styles/fonts/my_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hintTxt, required this.icon, this.controller, this.validator});

  final String hintTxt;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        validator: validator,
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            icon,
            color: MyColors.gray,
            size: 20,
          ),
          hintStyle: MyFonts.styleRegular400_12.copyWith(color: MyColors.gray),
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
      ),
    );
  }
}
