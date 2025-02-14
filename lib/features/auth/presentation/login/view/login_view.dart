import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/core/utils/validators.dart';
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
            // TODO: Handle this case.
            throw UnimplementedError();
          case LoginViewModelLoading():
            const CircularProgressIndicator();
          case LoginViewModelSuccess():
            context.pushReplacementNamed(AppRoutes.homeScreen);
            aweSnackBar(
                msg: 'Success',
                context: context,
                type: MessageTypeConst.success,
                title: 'Success');
            break;
          case LoginViewModelError():
            aweSnackBar(
              title: 'Error !!',
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
                  title: 'Login',
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
                            hintTxt: 'Email',
                            controller: cubit.emailController,
                            validator: (value) =>
                                Validators.validateEmail(value, context),
                          ),
                          CustomTextFormField(
                            hintTxt: 'Password',
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
                title: 'Hey There',
                subTitle: 'WELCOME BACK'),
          ],
        ),
      ),
    );
  }
}
