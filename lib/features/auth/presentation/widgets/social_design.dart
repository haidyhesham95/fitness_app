import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget socialDesign(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding:EdgeInsets.only(left: 30.w,right: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Divider(color:context.colors.iconsColor)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(context.translate(LangKeys.or),
                  style: MyFonts.styleRegular400_16
                      .copyWith(color: context.colors.iconsColor)),
            ),
             Expanded(child: Divider(color:context.colors.iconsColor)),
          ],
        ),
      ),
      SizedBox(height: 28.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesFacebook,
            width: 32.w,
            height: 32.h,
          ),
          SizedBox(width: 16.w),
          Image.asset(
            Assets.imagesGoogle,
            width: 32.w,
            height: 32.h,
          ),
          SizedBox(width: 16.w),
          Image.asset(
            Assets.imagesApple,
            width: 32.w,
            height: 32.h,
          ),
        ],
      ),
    ],
  );
}
