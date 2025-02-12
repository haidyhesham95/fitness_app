import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../generated/assets.dart';

class CustomBlurBg extends StatelessWidget {
  const CustomBlurBg(
      {super.key,
      required this.widget,
      required this.title,
      required this.subTitle});

  final Widget widget;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            Assets.imagesForgetPasswordBg,
            fit: BoxFit.cover,
          ),
        ),
        // Blur effect
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.black.withValues(alpha: 0.2),
            ),
          ),
        ),
        // Top-center Fit image
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 46.h),
            child: Image.asset(
              Assets.imagesFit,
              width: 70.w,
              height: 48.h,
            ),
          ),
        ),
        // Scrollable content in center
        SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context)
                .size
                .height, // Allow full scrollable height
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(
                    title,
                    style: MyFonts.styleExtraBold800_20
                        .copyWith(color: Colors.grey),
                  ),
                  subtitle: Text(
                    subTitle,
                    style: MyFonts.styleRegular400_18
                        .copyWith(color: MyColors.white),
                  ),
                ),
                widget
              ],
            ),
          ),
        ),
      ],
    );
  }
}
