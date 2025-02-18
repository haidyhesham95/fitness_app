import 'package:fitness_app/core/networking/common/regester_context_module.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_action.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/localization/lang_keys.dart';
import '../../../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../../widgets/goal_activity/custom_goal_view.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpViewModel viewModel = getIt<SignUpViewModel>();

    return CustomGoalView(
      value: "6/6",
      progress: 0.99,
      items: {
        'level1': context.translate(LangKeys.rookie),
        'level2': context.translate(LangKeys.beginner),
        'level3': context.translate(LangKeys.intermediate),
        'level4': context.translate(LangKeys.advanced),
        'level5': context.translate(LangKeys.trueBeast),
      },
      title: context.translate(LangKeys.yourRegularPhysicalActivityLevel),
      button: CustomButton(
        txt: context.translate(LangKeys.next),
        onPressed: () async {
          viewModel.doAction(SignupActionSelected());
        },
      ),
      isGoalPage: false,
    );
  }
}
