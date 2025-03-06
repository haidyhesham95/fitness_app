import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/profile/presentation/widgets/info_center_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../../../auth/presentation/forget_password/widgets/custom_blur_bg.dart';

class InfoCenterWidget extends StatelessWidget {
  const InfoCenterWidget({super.key, required this.items, required this.title});
  final List<InfoCenterItem> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomBlurBg(
      isShow: true,
      onTap: () {
        context.pop();
      },
      isShowTextBar: true,
      height: 0,
      text: title,
      image: Assets.imagesEditBg,
      widget: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: context.colors.bgColor.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: context.colors.darkGray,
              thickness: 1,
            ),
            itemCount: items.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return items[index];
            },
          ),
        ),
      ),
    );
  }
}
