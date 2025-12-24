import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/widgets/base/custom_glassy_container.dart';
import '../../../forget_password/widgets/custom_blur_bg.dart';
import '../../view_model/signup_action.dart';
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
  final Map items; // key: String, value: String
  final Widget button;
  final double? progress;
  final bool? isGoalPage;
  final SignUpViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CustomBlurBg(
      value: value,
      progress: progress,
      widget: BlocProvider.value(
        value: viewModel, // ✅ نفس instance بدون create لكل item
        child: BlocConsumer<SignUpViewModel, SignUpViewModelState>(
          listener: (context, state) {
            // لو عندك Toast errors هنا (اختياري)
            // if (state is SignupError) ...
          },
          builder: (context, state) {
            final vm = context.read<SignUpViewModel>();

            final String? groupValue =
            (isGoalPage == true) ? vm.goal : vm.activity;

            return CustomGlassyContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: RadioGroup<String>(
                  groupValue: groupValue,
                  onChanged: (selected) {
                    if (selected == null) return;

                    if (isGoalPage == true) {
                      vm.doAction(SelectGoalAction(goal: selected));
                    } else {
                      vm.doAction(SelectActivityAction(activity: selected));
                    }
                  },
                  child: Column(
                    spacing: 16.h,
                    children: [
                      ...items.keys.map((key) {
                        return CustomContainerGoal(
                          txt: items[key].toString(),
                          keyValue: key.toString(), // ✅ ده اللي هيتخزن
                        );
                      }).toList(),
                      button,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      title: title,
      subTitle: subTitle,
      isShow: true,
    );
  }
}
