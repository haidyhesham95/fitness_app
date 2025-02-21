import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/profile/presentation/widgets/setting_list.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../../auth/presentation/forget_password/widgets/custom_blur_bg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBlurBg(
      isShow: true,
      isShowTextBar: true,
      height: 0,
      text: context.translate(LangKeys.profile),
      image: Assets.imagesBackGround,
      widget: Column(
        children: [
          CircleAvatar(
            radius: 75.r,
            backgroundImage: const AssetImage(Assets.imagesProfile),
          ),
          verticalSpacing(8.h),
          Text('Haidy Hesham',
              style: MyFonts.styleSemiBold600_20.copyWith(
                color: context.colors.white,
              )),
          verticalSpacing(40.h),
          const SettingList(),
          verticalSpacing(20.h),
        ],
      ),
    );
  }
}
