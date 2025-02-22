import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_actions.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:fitness_app/features/profile/presentation/widgets/editable_data.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class ProfileDateSection extends StatefulWidget {
  ProfileDateSection({super.key});

  @override
  State<ProfileDateSection> createState() => _ProfileDateSectionState();
}

class _ProfileDateSectionState extends State<ProfileDateSection> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileViewModelCubit>()
      ..doAction(GetUserData());
    return BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
      builder: (context, state) {
        switch(state) {
          case ProfileViewModelInitial():
          case getProfileLoading():
           const AppLoader();
          case getProfileSuccess():
          final user = state.data.user!;
          user.firstName = cubit.firstNameController.text;
          user.lastName = cubit.lastNameController.text;
          user.email = cubit.emailController.text;
          return Padding(
            padding: EdgeInsets.all(24.sp),
            child: Column(
              children: [
                CustomTextFormField(
                  hintTxt:user.firstName ?? '',
                  controller: cubit.firstNameController,
                  prefixImage: Assets.svgUser,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextFormField(
                  hintTxt: user.lastName ?? '',
                  controller: cubit.lastNameController,
                  prefixImage: Assets.svgUser,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextFormField(
                  hintTxt: user.email ?? '',
                  controller: cubit.emailController,
                  prefixImage: Assets.svgMail,
                ),
                SizedBox(
                  height: 40.h,
                ),
                const EditableData(),
              ],
            ),
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
