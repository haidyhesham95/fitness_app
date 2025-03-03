import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';

class InfoCenterItem extends StatelessWidget {
  const InfoCenterItem({
    super.key,
    this.subtitle,
    this.title,
  });

  final String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
      title: Text(
        title ?? '',
        style:
        MyFonts.styleSemiBold600_14.copyWith(color: context.colors.baseColor),
      ),
      subtitle: Text(
        subtitle ?? '',
        style: MyFonts.styleRegular400_14.copyWith(color: context.colors.white),
      ),
    );
  }
}
