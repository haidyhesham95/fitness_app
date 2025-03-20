import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/spacing.dart';
import '../viewModel/exercise_action.dart';
import '../viewModel/exercise_view_model_cubit.dart';
import 'difficulty_level_selector_widget.dart';
import 'exercise_list_widget.dart';

class ExerciseSelector extends StatefulWidget {
  final String primeMoverMuscleId;

  const ExerciseSelector({Key? key, required this.primeMoverMuscleId})
      : super(key: key);

  @override
  _ExerciseSelectorState createState() => _ExerciseSelectorState();
}

class _ExerciseSelectorState extends State<ExerciseSelector> {
  String? selectedDifficultyName;
  String? selectedDifficultyId;

  @override
  void initState() {
    super.initState();
    context.read<ExerciseViewModelCubit>().doAction(
          GetLevelsPrimeMoverMuscle(
              primeMoverMuscleId: widget.primeMoverMuscleId),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DifficultyLevelSelectorWidget(
              primeMoverMuscleId: widget.primeMoverMuscleId,
              onSelected: (difficultyId, difficultyName) {
                setState(() {
                  selectedDifficultyId = difficultyId;
                  selectedDifficultyName = difficultyName;
                });
                context.read<ExerciseViewModelCubit>().doAction(
                  GetExercises(
                    primeMoverMuscleId: widget.primeMoverMuscleId,
                    difficultyLevelId: difficultyId,
                  ),
                );
              },
            ),
            verticalSpacing(8.h),
            ExerciseListWidget(selectedDifficultyName: selectedDifficultyName)
          ],
        ),
      ),
    );
  }
}
