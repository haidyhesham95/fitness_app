import 'package:fitness_app/features/auth/presentation/register/view_model/signup_action.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/goal_activity/custom_goal_view.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_actions.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:fitness_app/features/profile/presentation/widgets/edit_profile_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/gender/health_data_widget.dart';
import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/utils/widgets/buttons/custom_button.dart';

class EditDataView extends StatelessWidget {
  final SignUpViewModel viewModel;

  const EditDataView({super.key, required this.viewModel, required this.step});
  final EditProfileStep step;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileViewModelCubit>()..doAction(GetUserData());
    return BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
      builder: (context, state) {

        final currentStep =step;
        final int totalSteps = 3;
        final int currentStepIndex = EditProfileStep.values.indexOf(currentStep) + 1;
        final String value = "$currentStepIndex/$totalSteps";
        final double progress = (currentStepIndex - 1) / (totalSteps - 1);
        String? title;
        String? text;
        int initialValue = 0;
        int minValue = 0;
        int maxValue = 0;
        ValueChanged<int> onSelected = (value) {};
        List<String>? goalItems;
        Map<String, String>? activityItems;
        bool isGoalPage = false;

        switch (currentStep) {
          case EditProfileStep.weight:
            title = context.translate(LangKeys.whatIsYourWeight);
            text = context.translate(LangKeys.kg);
            initialValue = cubit.selectedWeight ?? 0;
            minValue = 35;
            maxValue = 300;
            onSelected = (value) {
              cubit.selectedWeight = value;
              print('vvvvvvvvvvvvvv$value');
            };
            break;
          case EditProfileStep.goal:
            title = cubit.goal.isNotEmpty ? cubit.goal : context.translate(LangKeys.yourGoal);
            goalItems = [
              context.translate(LangKeys.gainWeight),
              context.translate(LangKeys.loseWeight),
              context.translate(LangKeys.getFitter),
              context.translate(LangKeys.gainMoreFlexible),
              context.translate(LangKeys.trueBeast),
            ];
            isGoalPage = true;
            break;
          case EditProfileStep.activity:
            title = cubit.activity.isNotEmpty ? cubit.activity : context.translate(LangKeys.yourActivityLevel);
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

        if (currentStep == EditProfileStep.goal || currentStep == EditProfileStep.activity) {
          return CustomGoalView(
            value: value,
            progress: progress,
            items: goalItems ?? activityItems!,
            title: title,
            subTitle: currentStep == EditProfileStep.goal
                ? context.translate(LangKeys.thisHelpsUsCreateYourPersonalizedPlan)
                : null,
            button: CustomButton(
              txt: context.translate(LangKeys.next),
              onPressed: () {
                if (currentStep == EditProfileStep.goal && cubit.goal.isNotEmpty) {
                  Navigator.pushReplacementNamed(context, AppRoutes.editProfileView);
                } else if (currentStep == EditProfileStep.activity && cubit.activity.isNotEmpty) {
                    cubit.doAction(EditProfile({
                      'firstName': cubit.firstNameController.text,
                      'lastName': cubit.lastNameController.text,
                      'email': cubit.emailController.text,
                      'weight': cubit.selectedWeight,  // Ensure weight is saved
                      'goal': cubit.goal,
                      'activityLevel': cubit.activity,
                    }));
              }
              },
            ),
            isGoalPage: isGoalPage, viewModel: viewModel,
          );
        } else {
          return HealthDataWidget(
            text: text!,
            title: title,
            value: value,
            progress: progress,
            initialValue: initialValue,
            minValue: minValue,
            maxValue: maxValue,
            onSelected: onSelected,
            onPressed: () {
              viewModel.doAction(NextStepAction());
            },
            onTap: () {
              viewModel.doAction(BackStepAction());
            },
          );
        }
      },
    );
  }
}

