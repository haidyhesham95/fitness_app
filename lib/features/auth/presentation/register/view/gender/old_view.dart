import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/gender/health_data_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/networking/common/regester_context_module.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../view_model/signup_action.dart';
import '../../view_model/signup_view_model_cubit.dart';

class OldView extends StatefulWidget {
  const OldView({super.key});

  @override
  State<OldView> createState() => _OldViewState();
}

class _OldViewState extends State<OldView> {
  late final SignUpViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<SignUpViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return HealthDataWidget(
      text: context.translate(LangKeys.year),
      title: context.translate(LangKeys.howOldAreYou),
      value: "2/6",
      progress: 0.2,
      initialValue: viewModel.SelectedAge,
      minValue: 10,
      maxValue: 100,
      onSelected: (value) {
        setState(() {
          viewModel.SelectedAge = value;
        });
        viewModel.doAction(SelectAgeAction(age: value));
      },
      onPressed: () {
        context.pushNamed(AppRoutes.weightView);
      },
    );
  }
}