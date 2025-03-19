import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/app_cubit/app_cubit.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/home/presentation/widgets/recommendation_section.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../meals/presentation/viewModel/meals_view_model_cubit.dart';

class MealsSection extends StatefulWidget {
  const MealsSection({super.key});

  @override
  State<MealsSection> createState() => _MealsSectionState();
}

class _MealsSectionState extends State<MealsSection> {
  MealsViewModelCubit get viewModel => context.read<MealsViewModelCubit>();
  AppCubit get appCubit => context.read<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsViewModelCubit, MealsViewModelState>(
        builder: (context, state) {
          return FadeInLeft(
            child: RecommendationSection(
                onTapItem: (index) {
                  viewModel.doAction(FilterMealsByCategory(viewModel.categories[index].categoryName));
                  context.pushNamed(AppRoutes.mealsView);
                },
                onTapSeeAll: () {
                  appCubit.updateIndex(0);
                  context.pushNamed(AppRoutes.mealsView);
                },
                showSeeAll: true,
                data: viewModel.categories,
                title: "Recommendation For You"),
          );
    });
  }
}
