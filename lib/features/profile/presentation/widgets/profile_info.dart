import 'dart:io';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../view_model/profile_view_model_cubit.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});
  final File? _image = null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
      builder: (context, state) {
        switch (state) {
          case ProfileViewModelInitial():
          case getProfileLoading():
            return const AppLoader();
          case getProfileError():
            return Center(child: Text(state.errorMessage.error.toString()));
          case getProfileSuccess():
            final user = state.data.user!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 75.r,
                  backgroundImage: _image == null
                      ? NetworkImage(user.photo.toString())
                      : FileImage(_image) as ImageProvider,
                  backgroundColor: context.colors.gray,
                ),
                verticalSpacing(8.h),
                Text(user.firstName! + ' ' + user.lastName!,
                    style: MyFonts.styleSemiBold600_20.copyWith(
                      color: context.colors.white,
                    )),
              ],
            );
          case EditProfileViewModelInitial():
          case EditProfileLoading():
          case EditProfileSuccess():
          case EditProfileError():
          case UploadPhotoLoading():
          case UploadPhotoError():
          case UploadPhotoSuccess():
        }
        return Container();
      },
    );
  }
}
