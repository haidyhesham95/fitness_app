 import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/styles/colors/my_colors.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/media_query_values.dart';
import 'package:fitness_app/core/utils/widgets/buttons/custom_button.dart';
import 'package:fitness_app/features/auth/presentation/login/viewModel/login_view_model_cubit.dart';
import 'package:fitness_app/features/auth/presentation/widgets/custom_text_span.dart';
import 'package:fitness_app/features/auth/presentation/widgets/social_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget loginWidget(BuildContext context){
  final cubit = context.read<LoginViewModel>();

  return Column(
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          context.translate(LangKeys.forgetPassword),
          style: MyFonts.styleRegular400_12.copyWith(
              color: MyColors.baseColor,
              decoration: TextDecoration.underline,
              decorationColor:MyColors.baseColor),
        ),
      ),
      SizedBox(height: 24.h,),
      socialDesign(context),
      SizedBox(height: 30.h),
      GestureDetector(
        onTap: (){
          cubit.signInButtonPressed();
        },
        child:  CustomButton(
          txt:context.translate(LangKeys.login),
        ),
      ),
      SizedBox(height: 10.h),
      GestureDetector(
        onTap: (){
          Navigator.pushReplacementNamed(context, AppRoutes.signUp);
        },
        child:  CustomTextSpanWidget(title: context.translate(LangKeys.doNotHaveAnAccount), subTitle:context.translate(LangKeys.register),
        ),
      ),
    ],
  );
}