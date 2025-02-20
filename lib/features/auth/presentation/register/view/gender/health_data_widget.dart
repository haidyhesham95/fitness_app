import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/gender/health_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../../view_model/signup_action.dart';
import '../../view_model/signup_view_model_cubit.dart';
import '../../widgets/gender/sign_up_step.dart';
import '../../widgets/goal_activity/custom_goal_view.dart';

class HealthDataPage extends StatelessWidget {
  final SignUpViewModel viewModel;

  const HealthDataPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpViewModel, SignUpViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        final currentStep = viewModel.currentStep;
        final int totalSteps = 6;
        final int currentStepIndex = SignUpStep.values.indexOf(currentStep) + 2;
        final String value = "$currentStepIndex/$totalSteps";
        final double progress = (currentStepIndex - 1) / (totalSteps - 1);

        String title;
        String? text;
        int? initialValue;
        int? minValue;
        int? maxValue;
        ValueChanged<int> onSelected = (value) {};
        List<String>? goalItems;
        Map<String, String>? activityItems;
        bool isGoalPage = false;

        switch (currentStep) {
          case SignUpStep.age:
            title = context.translate(LangKeys.howOldAreYou);
            text = context.translate(LangKeys.year);
            initialValue = viewModel.selectedAge;
            minValue = 10;
            maxValue = 100;
            onSelected = (value) {
              viewModel.doAction(SelectAgeAction(age: value));
            };
            break;
          case SignUpStep.weight:
            title = context.translate(LangKeys.whatIsYourWeight);
            text = context.translate(LangKeys.kg);
            initialValue = viewModel.selectedWeight;
            minValue = 35;
            maxValue = 300;
            onSelected = (value) {
              viewModel.doAction(SelectWeightAction(weight: value));
            };
            break;
          case SignUpStep.height:
            title = context.translate(LangKeys.whatIsYourHeight);
            text = context.translate(LangKeys.cm);
            initialValue = viewModel.selectedHeight;
            minValue = 100;
            maxValue = 220;
            onSelected = (value) {
              viewModel.doAction(SelectHeightAction(height: value));
            };
            break;
          case SignUpStep.goal:
            title = context.translate(LangKeys.whatIsYourGoal);
            goalItems = [
              context.translate(LangKeys.gainWeight),
              context.translate(LangKeys.loseWeight),
              context.translate(LangKeys.getFitter),
              context.translate(LangKeys.gainMoreFlexible),
              context.translate(LangKeys.trueBeast),
            ];
            isGoalPage = true;
            break;
          case SignUpStep.activity:
            title =
                context.translate(LangKeys.yourRegularPhysicalActivityLevel);
            activityItems = {
              'level1': context.translate(LangKeys.rookie),
              'level2': context.translate(LangKeys.beginner),
              'level3': context.translate(LangKeys.intermediate),
              'level4': context.translate(LangKeys.advanced),
              'level5': context.translate(LangKeys.trueBeast),
            };
            isGoalPage = false;
            break;
        }

        if (currentStep == SignUpStep.goal ||
            currentStep == SignUpStep.activity) {
          return CustomGoalView(
            value: value,
            progress: progress,
            items: goalItems ?? activityItems!,
            title: title,
            subTitle: currentStep == SignUpStep.goal
                ? context
                    .translate(LangKeys.thisHelpsUsCreateYourPersonalizedPlan)
                : null,
            viewModel: viewModel,
            button: CustomButton(
              txt: context.translate(LangKeys.next),
              onPressed: () {
                if (currentStep == SignUpStep.goal &&
                    viewModel.goal.isNotEmpty) {
                  viewModel.doAction(NextStepAction());
                } else if (currentStep == SignUpStep.activity &&
                    viewModel.activity.isNotEmpty) {
                  viewModel.doAction(SignupActionSelected());
                  Navigator.pushNamed(context, AppRoutes.login);
                }
              },
            ),
            isGoalPage: isGoalPage,
          );
        } else {
          return HealthDataWidget(
            text: text!,
            title: title,
            value: value,
            progress: progress,
            initialValue: initialValue!,
            minValue: minValue!,
            maxValue: maxValue!,
            onSelected: onSelected,
            onPressed: () {
              viewModel.doAction(NextStepAction());
            },
          );
        }
      },
    );
  }
}
