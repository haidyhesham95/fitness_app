import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../viewModel/exercise_action.dart';
import '../viewModel/exercise_view_model_cubit.dart';
import 'container_selectable_widget.dart';

class DifficultyLevelSelectorWidget extends StatefulWidget {
  final Function(String, String) onSelected;
  final String primeMoverMuscleId;

  const DifficultyLevelSelectorWidget({
    Key? key,
    required this.onSelected,
    required this.primeMoverMuscleId,
  }) : super(key: key);

  @override
  State<DifficultyLevelSelectorWidget> createState() =>
      _DifficultyLevelSelectorWidgetState();
}

class _DifficultyLevelSelectorWidgetState extends State<DifficultyLevelSelectorWidget> {
  String? selectedDifficultyName;
  String? selectedDifficultyId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseViewModelCubit, ExerciseViewModelState>(
      buildWhen: (previous, current) =>
      current is LevelsPrimeMoverMuscleSuccess,
      builder: (context, state) {
        if (state is LevelsPrimeMoverMuscleSuccess) {
          final data = state.data.difficultyLevels;

          if (selectedDifficultyName == null && data.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  selectedDifficultyName = data.first.name;
                  selectedDifficultyId = data.first.id;
                });
                widget.onSelected(selectedDifficultyId!, selectedDifficultyName!);
                context.read<ExerciseViewModelCubit>().doAction(
                  GetExercises(
                    primeMoverMuscleId: widget.primeMoverMuscleId,
                    difficultyLevelId: selectedDifficultyId!,
                  ),
                );
              }
            });
          }
          return ContainerSelectableWidget(
            child: ListView.separated(
              separatorBuilder: (context, index) => horizontalSpacing(20.w),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final difficulty = data[index];
                return _buildSelectableText(difficulty.name, difficulty.id);
              },
            ),
          );
        }
        return const AppLoader();
      },
    );
  }

  Widget _buildSelectableText(String text, String id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDifficultyName = text;
          selectedDifficultyId = id;
        });
        widget.onSelected(id, text);
        context.read<ExerciseViewModelCubit>().doAction(
          GetExercises(
            primeMoverMuscleId: widget.primeMoverMuscleId,
            difficultyLevelId: selectedDifficultyId!,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selectedDifficultyName == text
              ? context.colors.baseColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: MyFonts.styleBold700_12.copyWith(
            color: context.colors.white,
          ),
        ),
      ),
    );
  }
}