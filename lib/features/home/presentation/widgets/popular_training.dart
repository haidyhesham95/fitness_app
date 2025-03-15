import 'package:fitness_app/features/home/presentation/widgets/popular_training_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewModel/home_view_model_cubit.dart';
import 'home_loading_widget.dart';

class PopularTraining extends StatelessWidget {
  const PopularTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
        builder: (context, state) {
      switch (state) {
        case GetRandomExercisesLoading():
          return const HomeLoadingWidget();
        case GetRandomExercisesSuccess():
          return PopularTrainingSection(
            exercises: state.exercises.exercises,
          );
        case GetRandomExercisesError():
          return Container(
            height: 104.h,
            child: Center(
              child: Text(state.errorMessage.error ?? ""),
            ),
          );
        default:
          null;
      }
      return const SizedBox();
    });
  }
}
