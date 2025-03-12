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
      this.isShow = false,
      this.progress,
      this.value
      ,this.image
      ,this.text
      ,this.isShowTextBar = false
      ,this.height
      ,this.onTap
      });

  final Widget widget;
  final String? title, subTitle;
  final bool? isShow , isShowTextBar;
  final double? progress ,height;
  final String? value , image ,text;
  final  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
           image ?? Assets.imagesForgetPasswordBg,
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
            padding: EdgeInsets.only(top: 46.h, left: 16.w, right: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isShow == true
                    ? InkWell(
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
                            child: Image.asset(Assets.imagesArrowBack,
                                width: 10.w, height: 10.h),
                          ),
                      ),
                    )
                    : const SizedBox(),
                isShowTextBar == true ?
                Text(
                  text ?? "",
                  style: MyFonts.styleSemiBold600_24.copyWith(
                      color: context.colors.white),

                   ):
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
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpacing(height ?? 16.h),
                isShow == true
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
                              .copyWith(color: context.colors.white),
                        ),
                      )
                    : const SizedBox(),
                verticalSpacing(height ?? 16.h),
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
