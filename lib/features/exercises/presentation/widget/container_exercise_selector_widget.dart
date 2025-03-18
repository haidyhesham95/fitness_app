import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerExerciseSelectorWidget extends StatelessWidget {
  const ContainerExerciseSelectorWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.only(top: 0.h, bottom: 8.h, left: 8.w, right: 8.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.colors.bgColor.withValues(alpha: 0.8),
      ),
      child: child,
    );
  }
}
