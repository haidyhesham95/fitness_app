import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:fitness_app/features/profile/presentation/widgets/edit_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_app/core/utils/widgets/custom_text_form_field.dart';

class EditableData extends StatelessWidget {
   const EditableData({super.key});

   @override
   Widget build(BuildContext context) {
     final cubit = context.read<ProfileViewModelCubit>();

     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         EditTextWidget(
           editableText:context.translate(LangKeys.tapToEdit),
           editableTextColor: context.colors.baseColor,
           mainText:context.translate(LangKeys.yourWeight),
           mainTextColor:context.colors.white,
           parenthesisColor:context.colors.white,
         ),
         SizedBox(height: 8.h,),
         const CustomTextFormField(hintTxt: '90 Kg',),
         SizedBox(height: 16.h,),
         EditTextWidget(
           editableText:context.translate(LangKeys.tapToEdit),
           editableTextColor: context.colors.baseColor,
           mainText:context.translate(LangKeys.yourGoal),
           mainTextColor:context.colors.white,
           parenthesisColor:context.colors.white,
         ),
         SizedBox(height: 8.h,),
          CustomTextFormField(hintTxt:context.translate(LangKeys.gainWeight),),
         SizedBox(height: 16.h,),
         GestureDetector(
           onTap: (){
             Navigator.of(context).pushNamed(AppRoutes.activityView);
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
          CustomTextFormField(hintTxt: context.translate(LangKeys.rookie),),
       ],
     );
   }
 }
