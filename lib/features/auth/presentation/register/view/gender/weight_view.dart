import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/gender/health_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../view_model/signup_action.dart';
import '../../view_model/signup_view_model_cubit.dart';

class WeightView extends StatelessWidget {
  final SignUpViewModel viewModel;

  const WeightView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpViewModel, SignUpViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        return HealthDataWidget(
          text: context.translate(LangKeys.kg),
          title: context.translate(LangKeys.whatIsYourWeight),
          value: "3/6",
          progress: 0.3,
          initialValue: viewModel.selectedWeight,
          minValue: 35,
          maxValue: 300,
          onSelected: (value) {
            viewModel.selectedWeight = value;
            viewModel.doAction(SelectWeightAction(weight: value));
          },
          onPressed: () {
            context.pushNamed(
              AppRoutes.heightView,
              arguments: viewModel,
            );
          },
        );
      },
    );
  }
}
