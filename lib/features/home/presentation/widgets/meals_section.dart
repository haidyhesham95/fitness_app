import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/home/presentation/widgets/recommendation_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../meals/presentation/viewModel/meals_view_model_cubit.dart';
import 'home_loading_widget.dart';

class MealsSection extends StatefulWidget {
  const MealsSection({super.key});

  @override
  State<MealsSection> createState() => _MealsSectionState();
}

class _MealsSectionState extends State<MealsSection> {
  MealsViewModelCubit get viewModel => context.read<MealsViewModelCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsViewModelCubit, MealsViewModelState>(
        builder: (context, state) {
      switch (state) {
        case MealsCategoriesLoading():
          const HomeLoadingWidget();
          break;
        case MealsCategoriesSuccess():
          return FadeInLeft(
            child: RecommendationSection(
                onTapSeeAll: () {
                  context.pushNamed(AppRoutes.mealsView);
                },
                showSeeAll: true,
                data: viewModel.categories,
                title: "Recommendation For You"),
          );
        case MealsCategoriesError():
        default:
          null;
      }
      return const SizedBox();
    });
  }
}
