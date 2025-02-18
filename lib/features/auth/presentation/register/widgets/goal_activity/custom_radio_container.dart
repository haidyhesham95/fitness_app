import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_action.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/networking/common/regester_context_module.dart';
import '../../../../../../../core/styles/fonts/my_fonts.dart';
import '../../../../../../../core/utils/widgets/custom_toast.dart';

class CustomContainerGoal extends StatefulWidget {
  const CustomContainerGoal(
      {super.key,
      required this.txt,
      required this.isGoalPage,
      required this.keyValue});

  final String txt;
  final bool? isGoalPage;
  final String keyValue;

  @override
  State<CustomContainerGoal> createState() => _CustomContainerGoalState();
}

class _CustomContainerGoalState extends State<CustomContainerGoal> {
  bool isChecked = false;
  final SignUpViewModel viewModel = getIt<SignUpViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isGoalPage == true
        ? BlocProvider(
            create: (_) => viewModel,
            child: BlocBuilder<SignUpViewModel, SignUpViewModelState>(
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
                      viewModel
                          .doAction(SelectGoalAction(goal: value.toString()));
                    },
                    activeColor: context.colors.gray,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                );
              },
            ))
        : BlocProvider(
            create: (_) => viewModel,
            child: BlocConsumer<SignUpViewModel, SignUpViewModelState>(
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
                    value: widget.keyValue,
                    groupValue: viewModel.activity,
                    onChanged: (value) {
                      viewModel.doAction(
                          SelectActivityAction(activity: value.toString()));
                    },
                    activeColor: context.colors.gray,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                );
              },
              listener: (context, state) {
                if (state is SignupError) {
                  CustomToast.showErrorToast(
                      message: state.message.error.toString());
                }
              },
            ),
          );
  }
}
