import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/features/home/presentation/widgets/recommendation_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/common/register_context_module.dart';
import '../viewModel/home_action.dart';
import '../viewModel/home_view_model_cubit.dart';
import 'home_loading_widget.dart';

class MusclesSection extends StatelessWidget {
  const MusclesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<HomeViewModelCubit>()..doAction(GetRandomMuscles()),
      child: BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
          builder: (context, state) {
        switch (state) {
          case GetRandomMusclesLoading():
            return const HomeLoadingWidget();
          case GetRandomMusclesSuccess():
            return FadeInLeft(
              child: RecommendationSection(
                  data: state.muscles.muscles ?? [],
                  title: "Recommendation To Day"),
            );
          case GetRandomMusclesError():
            return Center(
              child: Text(state.errorMessage.error ?? ""),
            );
          default:
            null;
        }
        return const SizedBox();
      }),
    );
  }
}
