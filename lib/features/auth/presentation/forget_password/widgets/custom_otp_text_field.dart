import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';

class CustomOtpTextField extends StatelessWidget {
  const CustomOtpTextField({super.key, this.onSubmit});

  final void Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
        numberOfFields: 6,
        focusedBorderColor: MyColors.baseColor,
        cursorColor: MyColors.baseColor,
        textStyle:
            MyFonts.styleMedium500_20.copyWith(color: MyColors.baseColor),
        onSubmit: onSubmit);
  }
}
