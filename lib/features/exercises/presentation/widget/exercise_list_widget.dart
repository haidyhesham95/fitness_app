import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/exercise_view_model_cubit.dart';
import 'build_item_exercise_selector.dart';
import 'container_exercise_selector_widget.dart';

class ExerciseListWidget extends StatelessWidget {
  final String? selectedDifficultyName;

  const ExerciseListWidget({
    Key? key,
    required this.selectedDifficultyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<ExerciseViewModelCubit, ExerciseViewModelState>(
      buildWhen: (previous, current) =>
      current is ExerciseViewModelSuccess,
      builder: (context, state) {
        if (state is ExerciseViewModelSuccess) {
          final filteredExercises = state.data.exercises!
              .where((exercise) =>
          exercise.difficultyLevel == selectedDifficultyName)
              .toList();

          return filteredExercises.isNotEmpty
              ? ContainerExerciseSelectorWidget(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: filteredExercises.length,
              itemBuilder: (context, index) {
                final exercise = filteredExercises[index];
                return FadeInRight(
                  child: BuildItemExerciseSelector(
                    exercise: exercise,
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: context.colors.darkGray,
                thickness: 1,
              ),
            ),
          )
              : const AppLoader();
        }
        return const AppLoader();
      },
    );
  }
}
