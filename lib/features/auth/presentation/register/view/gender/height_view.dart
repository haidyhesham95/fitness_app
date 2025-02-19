import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/gender/health_data_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/networking/common/regester_context_module.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../view_model/signup_action.dart';
import '../../view_model/signup_view_model_cubit.dart';

class HeightView extends StatefulWidget {
  const HeightView({super.key});

  @override
  State<HeightView> createState() => _HeightViewState();
}

class _HeightViewState extends State<HeightView> {
  late final SignUpViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<SignUpViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpViewModel viewModel = getIt<SignUpViewModel>();
    return HealthDataWidget(
      text: context.translate(LangKeys.cm),
      title: context.translate(LangKeys.whatIsYourHeight),
      value: "4/6",
      progress: 0.5,
      initialValue: viewModel.SelectedHeight,
      minValue: 100,
      maxValue: 220,
      onSelected: (value) {
        setState(() {
          viewModel.SelectedHeight = value;
        });
        viewModel.doAction(SelectHeightAction(height: value));
      },
      onPressed: () {
        viewModel.doAction(SignupActionSelected());
        context.pushNamed(AppRoutes.login);
       //  context.pushNamed(AppRoutes.goalView);
      },
    );
  }
}
