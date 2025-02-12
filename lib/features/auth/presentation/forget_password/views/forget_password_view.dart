import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../../../../../core/utils/widgets/custom_glassy_container.dart';
import '../../../../../core/utils/widgets/custom_text_form_feild.dart';
import '../widgets/custom_blur_bg.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBlurBg(
      title: 'Enter Your Email',
      subTitle: 'Forget password',
      widget:  Padding(
        padding: const EdgeInsets.all(8),
        child: CustomGlassyContainer(child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 16.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextFormField(
                icon: Icons.email_outlined,
                hintTxt: 'Email',
              ),
              const CustomButton(txt: 'Sent OTP',),
            ],
          ),
        ),),
      ),
    );
  }
}
