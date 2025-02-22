import 'dart:io';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PictureProfileScreen extends StatelessWidget {
  const PictureProfileScreen({super.key});
  final File? _image = null;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
      builder: (context, state) {
        switch (state) {
          case ProfileViewModelInitial():
          case getProfileLoading():
            const AppLoader();
          case getProfileSuccess():
            final user = state.data.user!;
            return Align(
              alignment: Alignment.center,
              child: Container(
                height: 150.h,
                width: 150.w,
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 100.r,
                      backgroundImage: _image == null
                          ? NetworkImage(user.photo.toString())
                          : FileImage(_image) as ImageProvider,
                      backgroundColor: context.colors.gray,
                    ),
                    Container(
                      padding: EdgeInsets.all(6.sp),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        Assets.svgEdit,
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Positioned(
                      bottom: -35,
                      child: Text(
                        user.firstName! + ' ' + user.lastName!,
                        style: MyFonts.styleSemiBold600_20.copyWith(
                          color: context.colors.white,
                          shadows: [
                            const Shadow(
                              color: Colors.black,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
