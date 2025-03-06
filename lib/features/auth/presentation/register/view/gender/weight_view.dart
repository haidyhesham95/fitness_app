import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/gender/health_data_widget.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_actions.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../view_model/signup_view_model_cubit.dart';

class WeightView extends StatefulWidget {
  final int weight;

  const WeightView({
    super.key,
    required this.weight,
  });

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  var viewModel;

  @override
  void initState() {
    if (widget.weight > 35) {
      viewModel = context.read<ProfileViewModelCubit>();
    } else {
      viewModel = context.read<SignUpViewModel>();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ValueNotifier(viewModel.selectedWeight),
      builder: (context, value, child) {
        return HealthDataWidget(
          text: context.translate(LangKeys.kg),
          title: context.translate(LangKeys.whatIsYourWeight),
          value: widget.weight!=35 ? '' : "3/6",
          progress: widget.weight!=35  ? 0 : 0.3,
          initialValue: widget.weight == 35 ? viewModel.selectedWeight : widget.weight,
          minValue: 35,
          maxValue: 300,
          onSelected: (int value) {
            viewModel.selectedWeight = value;

            // viewModel.doAction(SelectWeightAction(weight: value));
          },
          onPressed: () {
            if (widget.weight == 35) {
              context.pushNamed(
                AppRoutes.heightView,
                arguments: viewModel,
              );
            } else {
              ProfileViewModelCubit viewModel =
              context.read<ProfileViewModelCubit>();
              viewModel.doAction(EditProfile({
                'weight': viewModel.selectedWeight, // Ensure weight is saved
              }));

        Navigator.of(context).restorablePopAndPushNamed(AppRoutes.editProfileView);

            }
          },
        );
      },
    );
  }
}
