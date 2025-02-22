import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_actions.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:fitness_app/features/profile/presentation/widgets/edit_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_app/core/utils/widgets/custom_text_form_field.dart';

import '../../../../di/di.dart';

class EditableData extends StatelessWidget {
   const EditableData({super.key});
   @override
   Widget build(BuildContext context) {
     return BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
  builder: (context, state) {
    switch(state) {
      case ProfileViewModelInitial():
      case getProfileLoading():
       const AppLoader();
      case getProfileSuccess():
        final user  = state.data.user;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(AppRoutes.weightView,arguments: getIt.get<SignUpViewModel>());
            },
            child: EditTextWidget(
              editableText:context.translate(LangKeys.tapToEdit),
              editableTextColor: context.colors.baseColor,
              mainText:context.translate(LangKeys.yourWeight),
              mainTextColor:context.colors.white,
              parenthesisColor:context.colors.white,
            ),
          ),
          SizedBox(height: 8.h,),
           CustomTextFormField(hintTxt:user!.weight.toString() ,),
          SizedBox(height: 16.h,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(AppRoutes.goalView,arguments: getIt.get<SignUpViewModel>());
            },
            child: EditTextWidget(
              editableText:context.translate(LangKeys.tapToEdit),
              editableTextColor: context.colors.baseColor,
              mainText:context.translate(LangKeys.yourGoal),
              mainTextColor:context.colors.white,
              parenthesisColor:context.colors.white,
            ),
          ),
          SizedBox(height: 8.h,),
          CustomTextFormField(hintTxt:user.goal.toString(),),
          SizedBox(height: 16.h,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(AppRoutes.activityView,arguments: getIt.get<SignUpViewModel>());
            },
            child: EditTextWidget(
              editableText:context.translate(LangKeys.tapToEdit),
              editableTextColor: context.colors.baseColor,
              mainText:context.translate(LangKeys.yourActivityLevel),
              mainTextColor:context.colors.white,
              parenthesisColor:context.colors.white,
            ),
          ),
          SizedBox(height: 8.h,),
          CustomTextFormField(hintTxt: user.activityLevel ?? '',),
        ],
      );
      case getProfileError():
      case EditProfileViewModelInitial():
      case EditProfileLoading():
      case EditProfileSuccess():
      case EditProfileError():
    }
   return Container();
  },
);
   }
 }
