import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/base_view.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_actions.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_view_model_cubit.dart';
import 'package:fitness_app/features/meals/presentation/widget/food_item.dart';
import 'package:fitness_app/features/meals/presentation/widget/tab_bar_widget.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsView extends StatefulWidget {
  const MealsView({Key? key}) : super(key: key);

  @override
  _MealsViewState createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {
  MealsViewModelCubit get viewModel => context.read<MealsViewModelCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.doAction(LoadMealsCategories());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealsViewModelCubit, MealsViewModelState>(
      builder: (context, state) {
        return BaseView(
          child: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: _PinnedHeaderDelegate(
                child: DefaultTabController(
                  length: viewModel.categories.length,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: tabBarWidget(
                      tabs: [
                        ...viewModel.categories
                            .map((item) => Tab(text: item.categoryName)),
                      ],
                      onTap: (index) {
                        viewModel.doAction(FilterMealsByCategory(
                            viewModel.categories[index].categoryName));
                      },
                      context: context,
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 17.h,
                  mainAxisSpacing: 17.w,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return index % 2 == 1
                        ? FadeInUpBig(
                            child: FoodItem(
                              meal: viewModel.meals[index],
                            ),
                          )
                        : FadeInDownBig(
                            child: FoodItem(
                              meal: viewModel.meals[index],
                            ),
                          );
                  },
                  childCount: viewModel.meals.length,
                ),
              ),
            ),
          ],
          image: Assets.imagesMealBg,
          isArrowBackShow: true,
          subTitle: context.translate(LangKeys.foodRecommendation),
        );
      },
      listener: (context, state) {
        if (state is MealsCategoriesSuccess) {
          viewModel.doAction(
              FilterMealsByCategory(viewModel.categories[0].categoryName));
        }
      },
    );
  }
}

class _PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _PinnedHeaderDelegate({required this.child});

  @override
  double get minExtent => 60.0;

  @override
  double get maxExtent => 60.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: context.colors.transparent,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
