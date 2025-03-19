import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/profile/presentation/widgets/profile_info.dart';
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
      isShow: false,
      isShowTextBar: true,
      height: 0,
      text: context.translate(LangKeys.profile),
      image: Assets.imagesEditBg,
      widget: Column(
        spacing: 20.h,
        children: [
          const ProfileInfo(),
          const SettingList(),
          verticalSpacing(50.h)
        ],
      ),
    );
  }
}
