import 'dart:ui';

import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radial_progress/radial_progress.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../generated/assets.dart';

class CustomBlurBg extends StatelessWidget {
  const CustomBlurBg(
      {super.key,
      required this.widget,
      this.title,
      this.subTitle,
      this.isGoalOrActivity = false,
      this.progress,
      this.value});

  final Widget widget;
  final String? title, subTitle;
  final bool? isGoalOrActivity;
  final double? progress;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.imagesForgetPasswordBg,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.black.withValues(alpha: 0.2),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 46.h, left: 24.w, right: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isGoalOrActivity == true
                    ? GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            color: context.colors.baseColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: context.colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                Image.asset(
                  Assets.imagesFit,
                  width: 70.w,
                  height: 48.h,
                ),
                const SizedBox()
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isGoalOrActivity == true
                    ? RadialProgressWidget(
                        animationDuration: const Duration(milliseconds: 3000),
                        percent: progress ?? 0,
                        diameter: 40,
                        bgLineColor: Colors.transparent,
                        progressLineWidth: 5,
                        progressLineColors: [context.colors.baseColor],
                        startAngle: StartAngle.top,
                        centerChild: Text(
                          value ?? "",
                          maxLines: 1,
                          style: MyFonts.styleMedium500_14
                              .copyWith(color: context.colors.baseColor),
                        ),
                      )
                    : const SizedBox(),
                verticalSpacing(16.h),
                ListTile(
                  title: Text(
                    title ?? "",
                    style: MyFonts.styleExtraBold800_20
                        .copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    subTitle ?? "",
                    style: MyFonts.styleRegular400_18
                        .copyWith(color: context.colors.gray),
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
