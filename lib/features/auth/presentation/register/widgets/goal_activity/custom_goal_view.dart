import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/widgets/base/custom_glassy_container.dart';
import '../../../forget_password/widgets/custom_blur_bg.dart';
import '../../view_model/signup_view_model_cubit.dart';
import 'custom_radio_container.dart';

class CustomGoalView extends StatelessWidget {
  const CustomGoalView({
    super.key,
    this.title,
    this.subTitle,
    required this.items,
    required this.button,
    this.progress,
    this.value,
    this.isGoalPage,
    required this.viewModel,
  });

  final String? title, subTitle, value;
  final dynamic items;
  final Widget button;
  final double? progress;
  final bool? isGoalPage;
  final SignUpViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CustomBlurBg(
      value: value,
      progress: progress,
      widget: CustomGlassyContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            spacing: 16.h,
            children: [
              if (items is List) ...[
                ...items
                    .map((item) => CustomContainerGoal(
                          txt: item,
                          isGoalPage: isGoalPage,
                          keyValue: item,
                  viewModel: viewModel,
                        ))
                    .toList(),
              ] else if (items is Map) ...[
                ...items.keys
                    .map((key) => CustomContainerGoal(
                          txt: items[key],
                          isGoalPage: isGoalPage,
                          keyValue: key,
                  viewModel: viewModel,
                        ))
                    .toList(),
              ] else
                Container(),
              button,
            ],
          ),
        ),
      ),
      title: title,
      subTitle: subTitle,
      isShow: true,
    );
  }
}

