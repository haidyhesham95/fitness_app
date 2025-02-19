import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/gender/health_data_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/networking/common/regester_context_module.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../view_model/signup_action.dart';
import '../../view_model/signup_view_model_cubit.dart';

class WeightView extends StatefulWidget {
  const WeightView({super.key});

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  late final SignUpViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<SignUpViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return HealthDataWidget(
      text: context.translate(LangKeys.kg),
    title: context.translate(LangKeys.whatIsYourWeight),
      value: "3/6",
      progress: 0.3,
      initialValue: viewModel.SelectedWeight,
      minValue: 35,
      maxValue: 300,
      onSelected: (value) {
        setState(() {
          viewModel.SelectedWeight = value;
        });
        viewModel.doAction(SelectWeightAction(weight: value));
      },
      onPressed: () {
        context.pushNamed(AppRoutes.heightView);
      },
    );
  }
}
