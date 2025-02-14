import 'dart:ui';
import 'package:fitness_app/core/styles/colors/my_colors.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/features/auth/presentation/login/widgets/login_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBlur extends StatelessWidget {
  const CustomBlur({
    super.key,
    required this.widget,
    required this.title,
  });
  final Widget widget;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: MyColors.containerColor.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(30),
              ),
              child: SizedBox(
                height: 398.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: MyFonts.styleExtraBold800_24
                          .copyWith(color: MyColors.white),
                      textAlign: TextAlign.center,
                    ),
                    widget,
                    loginWidget(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
