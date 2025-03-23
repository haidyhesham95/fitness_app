import 'package:fitness_app/core/app_cubit/app_cubit.dart';
import 'package:fitness_app/core/networking/common/register_context_module.dart';
import 'package:fitness_app/core/utils/widgets/pinned_sliver_widget.dart';
import 'package:fitness_app/core/utils/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';

import '../viewModel/exercise_action.dart';
import '../viewModel/exercise_view_model_cubit.dart';

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
  ExerciseViewModelCubit viewModel = getIt.get<ExerciseViewModelCubit>();
  AppCubit appCubit = getIt.get<AppCubit>();



  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomScrollView(
        slivers: [
          PinnedSliverWidget(
            child: DefaultTabController(
              initialIndex: appCubit.selectedIndex,
              length: viewModel.difficultyLevels.length,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: tabBarWidget(
                  tabs: viewModel.difficultyLevels
                      .map((item) => Tab(text: item.name))
                      .toList(),
                  onTap: (index) {
                    viewModel.doAction(GetLevelsPrimeMoverMuscle(
                      primeMoverMuscleId: viewModel.difficultyLevels[index].id,
                    ));
                  },
                  context: context,
                ),
              ),
            ),
          ),
          // DifficultyLevelSelectorWidget(
          //   primeMoverMuscleId: widget.primeMoverMuscleId,
          //   onSelected: (difficultyId, difficultyName) {
          //     setState(() {
          //       selectedDifficultyId = difficultyId;
          //       selectedDifficultyName = difficultyName;
          //     });
          //     context.read<ExerciseViewModelCubit>().doAction(
          //           GetExercises(
          //             primeMoverMuscleId: widget.primeMoverMuscleId,
          //             difficultyLevelId: difficultyId,
          //           ),
          //         );
          //   },
          // ),

        ],
      ),
    );
  }
}
