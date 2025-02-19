import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/core/utils/validators.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/core/utils/widgets/base/snack_bar.dart';
import 'package:fitness_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/sign_up_blur.dart';
import 'package:fitness_app/features/auth/presentation/widgets/custom_blur_bg.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.watch<SignUpViewModel>();
    return BlocListener<SignUpViewModel, SignUpViewModelState>(
      listener: (context, state) {
      switch(state) {
        case SignupInitial():
        case SignupLoading():
         const AppLoader();
        case SignupSuccess():
          context.pushReplacementNamed(AppRoutes.login);
          aweSnackBar(
              msg: context.translate(LangKeys.success),
              context: context,
              type: MessageTypeConst.success,
              title: context.translate(LangKeys.success));
          break;
        case SignupError():
          aweSnackBar(
            title: context.translate(LangKeys.error),
            msg: state.message.error!,
            context: context,
            type: MessageTypeConst.failure,
          );
          break;

          default:
            null;
        }
      },
      child: CustomBlurBg(
          widget:
      Form(
        key:signUpCubit.signUpFormKey,
        child: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: SignUpBlur(
            title: context.translate(LangKeys.register),
            widget: Padding(
              padding: EdgeInsets.all(4.sp),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  spacing: 16.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     CustomTextFormField(
                      prefixImage: Assets.svgUser,
                      hintTxt: context.translate(LangKeys.firstName),
                      controller: signUpCubit.firstNameController,
                    ),
                     CustomTextFormField(
                      prefixImage: Assets.svgUser,
                      hintTxt: context.translate(LangKeys.lastName),
                      controller: signUpCubit.lastNameController,
                     ),
                     CustomTextFormField(
                      prefixImage: Assets.svgMail,
                      hintTxt: context.translate(LangKeys.email),
                      controller: signUpCubit.emailController,
                       validator: (value)=> Validators.validateEmail(value, context),
                     ),
                      CustomTextFormField(
                      hintTxt: context.translate(LangKeys.password),
                      prefixImage: Assets.svgLock,
                      suffixIcon: Assets.svgEye,
                        controller: signUpCubit.passwordController,
                        validator: (value)=> Validators.validatePassword(value, context),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ), title: context.translate(LangKeys.heyThere), subTitle: context.translate(LangKeys.createAnAccount)),
    );
  }
}
