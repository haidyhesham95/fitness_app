import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/exercise_view_model_cubit.dart';
import 'build_item_exercise_selector.dart';
import 'container_exercise_selector_widget.dart';

class ExerciseListWidget extends StatefulWidget {


  const ExerciseListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ExerciseListWidget> createState() => _ExerciseListWidgetState();
}

class _ExerciseListWidgetState extends State<ExerciseListWidget> {
  ExerciseViewModelCubit get viewModel => context.read<ExerciseViewModelCubit>();
  @override
  Widget build(BuildContext context) {

   return BlocBuilder<ExerciseViewModelCubit, ExerciseViewModelState>(

      builder: (context, state) {
  return ContainerExerciseSelectorWidget(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: viewModel.exercises.length,
              itemBuilder: (context, index) {
                return FadeInRight(
                  child: BuildItemExerciseSelector(
                    exercise: viewModel.exercises[index],
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: context.colors.darkGray,
                thickness: 1,
              ),
            ),
          );


      },
    );
  }
}
