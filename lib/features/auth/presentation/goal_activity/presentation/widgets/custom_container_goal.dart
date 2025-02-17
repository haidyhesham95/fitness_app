import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/auth/presentation/goal_activity/presentation/viewModel/goal_cubit/goal_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/networking/common/regester_context_module.dart';
import '../../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../../core/utils/widgets/custom_toast.dart';

class CustomContainerGoal extends StatefulWidget {
  const CustomContainerGoal({super.key, required this.txt});

  final String txt;

  @override
  State<CustomContainerGoal> createState() => _CustomContainerGoalState();
}

class _CustomContainerGoalState extends State<CustomContainerGoal> {
  bool isChecked = false;
  late final GoalViewModelCubit viewModel;

  @override
  void initState() {
    viewModel = getIt<GoalViewModelCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => viewModel,
        child: BlocConsumer<GoalViewModelCubit, GoalViewModelState>(
            builder: (context, state) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: context.colors.white),
            ),
            child: RadioListTile<String>(
              title: Text(
                widget.txt,
                style: MyFonts.styleBold700_12
                    .copyWith(color: context.colors.gray),
              ),
              value: widget.txt,
              groupValue: viewModel.goal,
              onChanged: (value) {
                setState(() {
                  viewModel.goal = value!;
                });
                viewModel.getGoalAction();
              },
              activeColor: context.colors.gray,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          );
        }, listener: (context, state) {
          switch (state) {
            case GoalViewModelError():
              CustomToast.showErrorToast(
                  message: state.errorMessage.error.toString());
              break;
            default:
              null;
          }
        }));
  }
}
