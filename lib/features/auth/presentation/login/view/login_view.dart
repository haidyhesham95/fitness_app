import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/validators.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/core/utils/widgets/base/snack_bar.dart';
import 'package:fitness_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:fitness_app/features/auth/presentation/login/viewModel/login_view_model_cubit.dart';
import 'package:fitness_app/features/auth/presentation/login/widgets/login_blur.dart';
import 'package:fitness_app/features/auth/presentation/widgets/custom_blur_bg.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoginViewModel>();
    return BlocListener<LoginViewModel, LoginViewModelState>(
      listener: (context, state) {
        switch (state) {
          case LoginViewModelInitial():

          case LoginViewModelLoading():
              const AppLoader();
          case LoginViewModelSuccess():
            aweSnackBar(
                msg:context.translate(LangKeys.success),
                context: context,
                type: MessageTypeConst.success,
                title: context.translate(LangKeys.success));
            break;
          case LoginViewModelError():
            aweSnackBar(
              title: context.translate(LangKeys.error),
              msg: state.errorMessage.error!,
              context: context,
              type: MessageTypeConst.failure,
            );
            break;
        }
      },
      child: Form(
        key: cubit.signInFormKey,
        child: Column(
          children: [
            CustomBlurBg(
                widget: CustomBlur(
                  title: context.translate(LangKeys.login),
                  widget: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        spacing: 16.h,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            prefixImage: Assets.svgMail,
                            hintTxt: context.translate(LangKeys.email),
                            controller: cubit.emailController,
                            validator: (value) =>
                                Validators.validateEmail(value, context),
                          ),
                          CustomTextFormField(
                            hintTxt:context.translate(LangKeys.password),
                            prefixImage: Assets.svgLock,
                            suffixIcon: Assets.svgEye,
                            controller: cubit.passwordController,
                            validator: (value) =>
                                Validators.validatePassword(value, context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                title:context.translate(LangKeys.heyThere) ,
                subTitle: context.translate(LangKeys.welcomeBack)),
          ],
        ),
      ),
    );
  }
}
