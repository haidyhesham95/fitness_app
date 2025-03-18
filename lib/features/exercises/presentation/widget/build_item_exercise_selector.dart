import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/exercises/presentation/widget/video_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../../domain/entities/exercises_entity.dart';
import 'image_exercise_selector.dart';

class BuildItemExerciseSelector extends StatelessWidget {
  const BuildItemExerciseSelector({super.key, required this.exercise});

  final Exercises exercise;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageExerciseSelector(exercise: exercise),
          SizedBox(width: 17.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.exercise.toString(),
                  style: MyFonts.styleMedium500_18.copyWith(
                    color: context.colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Text(
                  exercise.targetMuscleGroup.toString(),
                  style: MyFonts.styleRegular400_14.copyWith(
                    color: context.colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  exercise.primaryEquipment.toString(),
                  style: MyFonts.styleRegular400_14.copyWith(
                    color: context.colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          VideoSelectorWidget(
            exercise: exercise,
          )
        ],
      ),
    );
  }
}
