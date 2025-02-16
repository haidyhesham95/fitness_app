import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/widgets/custom_glassy_container.dart';
import '../../../forget_password/widgets/custom_blur_bg.dart';
import 'custom_container_goal.dart';

class CustomGoalView extends StatelessWidget {
  const CustomGoalView(
      {super.key,
      this.title,
      this.subTitle,
      this.containerTxt,
      required this.button,
      this.progress,
      this.value});

  final String? title, subTitle, containerTxt;
  final Widget button;
  final double? progress;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return CustomBlurBg(
      value: value,
      progress: progress,
      widget: CustomGlassyContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 24.h),
          child: Column(
            spacing: 16.h,
            children: [
              CustomContainerGoal(
                txt: containerTxt ?? "",
              ),
              CustomContainerGoal(
                txt: containerTxt ?? "",
              ),
              CustomContainerGoal(
                txt: containerTxt ?? "",
              ),
              CustomContainerGoal(
                txt: containerTxt ?? "",
              ),
              CustomContainerGoal(
                txt: containerTxt ?? "",
              ),
              button,
            ],
          ),
        ),
      ),
      title: title,
      subTitle: subTitle,
      isGoalOrActivity: true,
    );
  }
}
