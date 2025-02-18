import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/goal_activity/presentation/viewModel/goal_activity_view_model_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/networking/common/regester_context_module.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../widgets/custom_goal_view.dart';

class GoalView extends StatelessWidget {
  const GoalView({super.key});

  @override
  Widget build(BuildContext context) {
    final GoalActivityViewModelCubit viewModel =
        getIt<GoalActivityViewModelCubit>();
    return CustomGoalView(
      value: "5/6",
      progress: 0.8,
      items: [
        context.translate(LangKeys.gainWeight),
        context.translate(LangKeys.loseWeight),
        context.translate(LangKeys.getFitter),
        context.translate(LangKeys.gainMoreFlexible),
        context.translate(LangKeys.trueBeast),
      ],
      title: context.translate(LangKeys.whatIsYourGoal),
      subTitle:
          context.translate(LangKeys.thisHelpsUsCreateYourPersonalizedPlan),
      button: CustomButton(
        txt: context.translate(LangKeys.next),
        onPressed: () {
          debugPrint("--------------------------${viewModel.getGoal()}");
          context.pushNamed(AppRoutes.activityView,
              arguments: viewModel.getGoal());
        },
      ),
      isGoalPage: true,
    );
  }
}
