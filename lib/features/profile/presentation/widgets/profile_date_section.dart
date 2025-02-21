import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/core/utils/widgets/base/snack_bar.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_state.dart';
import 'package:fitness_app/features/profile/presentation/widgets/editable_data.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class ProfileDateSection extends StatelessWidget {
  ProfileDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileViewModelCubit>();
    return BlocListener<ProfileViewModelCubit, ProfileViewModelState>(
      listener: (context, state) {
        switch (state) {
          case ProfileViewModelInitial():
          case EditProfileLoading():
            const AppLoader();
            break;
          case EditProfileSuccess():
            aweSnackBar(
                msg: context.translate(LangKeys.success),
                context: context,
                type: MessageTypeConst.success,
                title: context.translate(LangKeys.success));
            break;
          case EditProfileError():
            aweSnackBar(
              title: context.translate(LangKeys.error),
              msg: state.error.error!,
              context: context,
              type: MessageTypeConst.failure,
            );
            break;
        }
      },
      child: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          children: [
            CustomTextFormField(
              hintTxt: 'Somaya',
              controller: cubit.firstNameController,
              prefixImage: Assets.svgUser,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              hintTxt: 'Mahmoud',
              controller: cubit.lastNameController,
              prefixImage: Assets.svgUser,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              hintTxt: 'somayamahmoud@gmail.com',
              controller: cubit.emailController,
              prefixImage: Assets.svgMail,
            ),
            SizedBox(
              height: 40.h,
            ),
            const EditableData(),
          ],
        ),
      ),
    );
  }
}
