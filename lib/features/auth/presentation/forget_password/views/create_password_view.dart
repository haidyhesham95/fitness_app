import 'package:fitness_app/core/styles/colors/my_colors.dart';
import 'package:fitness_app/core/utils/extension/media_query_values.dart';
import 'package:fitness_app/core/utils/validators.dart';
import 'package:fitness_app/core/utils/widgets/buttons/custom_button.dart';
import 'package:fitness_app/core/utils/widgets/custom_glassy_container.dart';
import 'package:fitness_app/core/utils/widgets/custom_text_form_feild.dart';
import 'package:fitness_app/features/auth/presentation/forget_password/widgets/custom_blur_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/localization/lang_keys.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBlurBg(
        widget: CustomGlassyContainer(
            child: Padding(
          padding: EdgeInsets.all(24.0.h),
          child: Column(
            spacing: 30.h,
            children: [
              CustomTextFormField(
                hintTxt: context.translate(LangKeys.email),
                validator: (value) {
                  return Validators.validateEmail(value, context);
                },
                icon: Icons.email_outlined,
              ),
              CustomTextFormField(
                hintTxt: context.translate(LangKeys.password),
                validator: (value) {
                  return Validators.validateEmail(value, context);
                },
                icon: Icons.lock_outline,
                suffixIcon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: MyColors.white,
                  size: 20,
                ),
              ),
              CustomButton(
                txt: context.translate(LangKeys.done),
                onTap: () {},
              )
            ],
          ),
        )),
        title: context.translate(LangKeys.makeSureItsCharactersOrMore),
        subTitle: context.translate(LangKeys.createNewPassword));
  }
}
