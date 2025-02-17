import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
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
          child: Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: context.colors.containerColor.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: MyFonts.styleExtraBold800_24
                      .copyWith(color: context.colors.white),
                  textAlign: TextAlign.center,
                ),
                widget,
                loginWidget(context),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
