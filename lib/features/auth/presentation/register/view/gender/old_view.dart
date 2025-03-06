import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/gender/health_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../view_model/signup_action.dart';
import '../../view_model/signup_view_model_cubit.dart';

class OldView extends StatelessWidget {
  final SignUpViewModel viewModel;

  const OldView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpViewModel, SignUpViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        return HealthDataWidget(
          text: context.translate(LangKeys.year),
          title: context.translate(LangKeys.howOldAreYou),
          value: "2/6",
          progress: 0.2,
          initialValue: viewModel.selectedAge,
          minValue: 10,
          maxValue: 100,
          onSelected: (value) {
            viewModel.selectedAge = value;
            viewModel.doAction(SelectAgeAction(age: value));
          },
          onPressed: () {
            context.pushNamed(
              AppRoutes.weightView,
              arguments: 35,
            );
          },
        );
      },
    );
  }
}
