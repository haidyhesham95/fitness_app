import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/base_view.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_view_model_cubit.dart';
import 'package:fitness_app/features/meals/presentation/widget/tab_bar_widget.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsView extends StatefulWidget {
  const MealsView({Key? key}) : super(key: key);

  @override
  _MealsViewState createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: [
        SliverToBoxAdapter(
          child: BlocBuilder<MealsViewModelCubit, MealsViewModelState>(
            builder: (context, state) {


              return state is MealsCategoriesSuccess? DefaultTabController(
                length: state.categories.length,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: tabBarWidget(
                    tabs: [
                      ...state.categories.map((item) => Tab(text: item.categoryName)),
                    ],
                    onTap: (index) {},
                    context: context,
                  ),
                ),
              ) : const SizedBox.shrink();
            },
          ),
        ),
        // SliverGrid(delegate: delegate, gridDelegate: gridDelegate)
      ],
      image: Assets.imagesMealBg,
      isArrowBackShow: true,
      subTitle: context.translate(LangKeys.foodRecommendation),
    );
  }
}

