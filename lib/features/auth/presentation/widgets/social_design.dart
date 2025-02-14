import 'package:fitness_app/core/styles/colors/my_colors.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget socialDesign() {
  return Column(
    children: [
      Padding(
        padding:EdgeInsets.only(left: 30.w,right: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Divider(color:MyColors.iconsColor)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text("Or",
                  style: MyFonts.styleRegular400_16
                      .copyWith(color: MyColors.iconsColor)),
            ),
            const Expanded(child: Divider(color:MyColors.iconsColor)),
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
