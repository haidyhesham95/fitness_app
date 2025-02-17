import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../widgets/custom_goal_view.dart';

class GoalView extends StatelessWidget {
  const GoalView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGoalView(
      value: "5/6",
      progress: 0.8,
      containerTxt: "Gain Weight",
      title: context.translate(LangKeys.whatIsYourGoal),
      subTitle:
          context.translate(LangKeys.thisHelpsUsCreateYourPersonalizedPlan),
      button: CustomButton(
          txt: context.translate(LangKeys.next),
          onPressed: () {
            context.pushNamed(AppRoutes.activityView);
          }),
    );
  }
}
