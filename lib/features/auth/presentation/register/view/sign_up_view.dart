import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/core/utils/validators.dart';
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
          // TODO: Handle this case.
          throw UnimplementedError();
        case SignupLoading():
          // TODO: Handle this case.
          throw UnimplementedError();
        case SignupSuccess():
          context.pushReplacementNamed(AppRoutes.login);
          aweSnackBar(
              msg: 'Success',
              context: context,
              type: MessageTypeConst.success,
              title: 'Success');
          break;
        case SignupError():
          aweSnackBar(
            title: 'Error !!',
            msg: state.message.error!,
            context: context,
            type: MessageTypeConst.failure,
          );
          break;
      }
      },
      child: CustomBlurBg(widget:
      Form(
        key:signUpCubit.signUpFormKey,
        child: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: SignUpBlur(
            title: 'Register',
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
                      hintTxt: 'First Name',
                      controller: signUpCubit.firstNameController,
                    ),
                     CustomTextFormField(
                      prefixImage: Assets.svgUser,
                      hintTxt: 'Last Name',
                      controller: signUpCubit.lastNameController,
                     ),
                     CustomTextFormField(
                      prefixImage: Assets.svgMail,
                      hintTxt: 'Email',
                      controller: signUpCubit.emailController,
                       validator: (value)=> Validators.validateEmail(value, context),
                     ),
                      CustomTextFormField(
                      hintTxt: 'Password',
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
      ), title: 'Hey There', subTitle: 'CREATE AN ACCOUNT'),
    );
  }
}
