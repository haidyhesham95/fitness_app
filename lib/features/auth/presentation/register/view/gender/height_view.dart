import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/gender/health_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../view_model/signup_action.dart';
import '../../view_model/signup_view_model_cubit.dart';

class HeightView extends StatelessWidget {
  final SignUpViewModel viewModel;

  const HeightView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpViewModel, SignUpViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        return HealthDataWidget(
          text: context.translate(LangKeys.cm),
          title: context.translate(LangKeys.whatIsYourHeight),
          value: "4/6",
          progress: 0.5,
          initialValue: viewModel.selectedHeight,
          minValue: 100,
          maxValue: 220,
          onSelected: (value) {
            viewModel.selectedHeight = value;
            viewModel.doAction(SelectHeightAction(height: value));
          },
          onPressed: () {
            context.pushNamed(
              AppRoutes.goalView,
              arguments: viewModel,
            );
          },
        );
      },
    );
  }
}