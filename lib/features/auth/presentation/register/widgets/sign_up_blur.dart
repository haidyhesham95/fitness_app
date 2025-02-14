import 'dart:ui';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/styles/colors/my_colors.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/widgets/buttons/custom_button.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/presentation/widgets/custom_text_span.dart';
import 'package:fitness_app/features/auth/presentation/widgets/social_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBlur extends StatelessWidget {
  const SignUpBlur({
    super.key,
    required this.widget,
    required this.title,
  });

  final Widget widget;
  final String title;

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpViewModel>();
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: MyColors.containerColor.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(30),
              ),
              child: SizedBox(
                height: 477.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: MyFonts.styleExtraBold800_24
                          .copyWith(color: MyColors.white),
                      textAlign: TextAlign.center,
                    ),
                    widget,
                    SizedBox(height: 10.h,),
                    socialDesign(),
                    SizedBox(height: 24.h,),
                    GestureDetector(
                      onTap: (){
                        signUpCubit.signUpButtonPressed();
                      },
                        child: const CustomButton(txt: 'Next')),
                    SizedBox(height: 24.h,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, AppRoutes.login);
                      },
                      child: const CustomTextSpanWidget(
                        title: 'Already Have An Account? ',
                        subTitle: 'Login',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
