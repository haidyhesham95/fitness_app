import 'package:fitness_app/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/utils/widgets/buttons/custom_button.dart';
import '../widgets/custom_goal_view.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGoalView(
      value: "6/6",
      progress: 0.99,
      containerTxt: "Rookie",
      title: context.translate(LangKeys.yourRegularPhysicalActivityLevel),
      button: CustomButton(txt: context.translate(LangKeys.next), onTap: () {}),
    );
  }
}
