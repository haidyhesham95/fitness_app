import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/app_cubit/app_cubit.dart';
import 'package:fitness_app/core/networking/common/register_context_module.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/home/presentation/viewModel/home_action.dart';
import 'package:fitness_app/features/home/presentation/widgets/recommendation_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/home_view_model_cubit.dart';

class MusclesSection extends StatefulWidget {
  const MusclesSection({super.key});

  @override
  State<MusclesSection> createState() => _MusclesSectionState();
}

class _MusclesSectionState extends State<MusclesSection> {
  var viewModel = getIt<HomeViewModelCubit>();
  @override
  void initState() {
    context.read<HomeViewModelCubit>().doAction(GetRandomMuscles());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
        builder: (context, state) {
          if (state is GetRandomMusclesSuccess) {
            var randomMusclesEntity = state.muscles;
            viewModel.randomMusclesEntity = randomMusclesEntity;
          }
          debugPrint('Recommendation To Day 2 ${viewModel.randomMusclesEntity.muscles}');
          return FadeInLeft(
            child: RecommendationSection(
              onTapItem: (index) {
                context.read<AppCubit>().updateIndex(0);
                context.pushNamed(
                  AppRoutes.exerciseView,
                  arguments: {
                    'id': viewModel.randomMusclesEntity.muscles![index]!.id!,
                    'title': viewModel.randomMusclesEntity.muscles![index]!.name!,
                    'imageUrl': viewModel.randomMusclesEntity.muscles![index]!.image??'',
                  },
                );
              },
                data: viewModel.randomMusclesEntity.muscles ?? [],
                title: "Recommendation To Day"),
          );
    });
  }
}
