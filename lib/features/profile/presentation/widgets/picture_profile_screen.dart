import 'dart:io';

import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/core/utils/widgets/base/snack_bar.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_actions.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../di/di.dart';

class PictureProfileScreen extends StatefulWidget {
  const PictureProfileScreen({super.key});

  @override
  State<PictureProfileScreen> createState() => _PictureProfileScreenState();
}

class _PictureProfileScreenState extends State<PictureProfileScreen> {
  File? _image = null;
  final ImagePicker _picker = ImagePicker();
  late final ProfileViewModelCubit profileViewModel;

  @override
  void initState() {
    super.initState();
    profileViewModel = getIt.get<ProfileViewModelCubit>();
  }

  Future<void> _pickImage(ImageSource imageSource) async {
    final pickedFile = await _picker.pickImage(source: imageSource);
    if (pickedFile != null) {
        _image = File(pickedFile.path);
        profileViewModel.doAction(UploadPhoto(_image!));
        debugPrint("------------------------------------------");
        debugPrint(_image.toString());
        debugPrint("-------------------------------------------");
    }
  }
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
              child: GestureDetector(
                onTap: () {
                  _pickImage(ImageSource.gallery);
                      Navigator.pop(context);
                },
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
                            : FileImage(_image!) as ImageProvider,
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
              ),
            );
          case getProfileError():
          case EditProfileViewModelInitial():
          case EditProfileLoading():
          case EditProfileSuccess():
          case EditProfileError():
          case UploadPhotoLoading():
            const AppLoader();
          case UploadPhotoError():
          aweSnackBar(msg: state.error.error!, context: context, type: MessageTypeConst.failure);
          case UploadPhotoSuccess():
            aweSnackBar(msg: 'Success', context: context, type: MessageTypeConst.success);
        }
        return Container();
      },
    );
  }
}
