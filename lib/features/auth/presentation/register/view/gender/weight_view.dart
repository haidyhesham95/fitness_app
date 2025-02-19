import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/gender/health_data_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../view_model/signup_action.dart';
import '../../view_model/signup_view_model_cubit.dart';

class WeightView extends StatefulWidget {
  final SignUpViewModel viewModel; // تم تمرير ViewModel كـ parameter

  const WeightView({super.key, required this.viewModel});

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  @override
  Widget build(BuildContext context) {
    return HealthDataWidget(
      text: context.translate(LangKeys.kg),
      title: context.translate(LangKeys.whatIsYourWeight),
      value: "3/6",
      progress: 0.3,
      initialValue: widget.viewModel.selectedWeight,
      minValue: 35,
      maxValue: 300,
      onSelected: (value) {
        setState(() {
          widget.viewModel.selectedWeight = value;
        });
        widget.viewModel.doAction(SelectWeightAction(weight: value));
      },
      onPressed: () {
        context.pushNamed(AppRoutes.heightView, arguments: widget.viewModel);
      },
    );
  }
}
