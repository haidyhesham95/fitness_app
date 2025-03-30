import 'package:fitness_app/core/app_cubit/app_cubit.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/features/exercises/presentation/viewModel/exercise_action.dart';
import 'package:fitness_app/features/exercises/presentation/widget/exercise_list_widget.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/base/base_view.dart';
import '../viewModel/exercise_view_model_cubit.dart';
import '../viewModel/exercise_view_model_state.dart';
import '../widget/exercise_details.dart';

class ExerciseView extends StatefulWidget {
  const ExerciseView(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});

  final String id, title, imageUrl;

  @override
  State<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
  String? selectedDifficultyName;
  String? selectedDifficultyId;

  ExerciseViewModelCubit get viewModel =>
      context.read<ExerciseViewModelCubit>();

  AppCubit get appCubit => context.read<AppCubit>();

  @override
  void initState() {
    super.initState();
  viewModel.doAction(
          GetLevelsPrimeMoverMuscle(primeMoverMuscleId: widget.id),
        );
    debugPrint(
        ' difficultyLevels ExerciseView : ${viewModel.difficultyLevels.map(
              (e) => e.name,
            ).toList()}');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseViewModelCubit, ExerciseViewModelState>(
      builder: (context, state) {
        return BaseView(
            extendBodyBehindAppBar: true,
            child: [
              ExerciseDetails(
                id: widget.id,
                imageUrl: widget.imageUrl,
                title: widget.title,
              ),
              SliverToBoxAdapter(child: verticalSpacing(8.h)),
              const SliverToBoxAdapter(child: ExerciseListWidget()),
            ],
            image: Assets.imagesMealBg,
            isArrowBackShow: true,
            blur: 7);
      },
      listener: (context, state) {
        if (state is LevelsPrimeMoverMuscleSuccess) {
          viewModel.doAction(GetExercises(
              primeMoverMuscleId: widget.id,
              difficultyLevelId:
                  viewModel.difficultyLevels[appCubit.selectedIndex].id));
        }
      },
    );
  }
}
