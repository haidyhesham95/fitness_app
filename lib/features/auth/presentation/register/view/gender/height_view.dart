import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/presentation/register/widgets/gender/health_data_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/localization/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../view_model/signup_action.dart';
import '../../view_model/signup_view_model_cubit.dart';

class HeightView extends StatefulWidget {
  final SignUpViewModel viewModel;

  const HeightView({super.key, required this.viewModel});

  @override
  State<HeightView> createState() => _HeightViewState();
}

class _HeightViewState extends State<HeightView> {
  @override
  Widget build(BuildContext context) {
    return HealthDataWidget(
      text: context.translate(LangKeys.cm),
      title: context.translate(LangKeys.whatIsYourHeight),
      value: "4/6",
      progress: 0.5,
      initialValue: widget.viewModel.selectedHeight,
      minValue: 100,
      maxValue: 220,
      onSelected: (value) {
        setState(() {
          widget.viewModel.selectedHeight = value;
        });
        widget.viewModel.doAction(SelectHeightAction(height: value));
      },
      onPressed: () {
        context.pushNamed(AppRoutes.goalView, arguments: widget.viewModel);
      },
    );
  }
}

