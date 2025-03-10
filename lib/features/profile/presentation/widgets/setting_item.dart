import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.onTap,
     this.text,
    required this.icon,
    this.trailing,
    this.title,
  });

  final void Function()? onTap;
  final String? text, icon;
  final Widget? trailing;
 final Widget? title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
minTileHeight: 5.h,
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
      onTap: onTap,
      leading: SvgPicture.asset(
        icon!,

      ),
      title: title ?? Text(
        text ?? '',
        style:
        MyFonts.styleSemiBold600_14.copyWith(color: context.colors.white),
      ),
      trailing: trailing ?? Icon(
        Icons.arrow_forward_ios,
        color: context.colors.baseColor,
      ),
    );
  }
}