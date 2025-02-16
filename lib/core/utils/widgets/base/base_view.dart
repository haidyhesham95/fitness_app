import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BaseView extends StatelessWidget {
  const BaseView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
          child: child,
        ));
  }
}
