import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/app_cubit/app_cubit.dart';
import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/base_view.dart';
import 'package:fitness_app/core/utils/widgets/pinned_sliver_widget.dart';
import 'package:fitness_app/core/utils/widgets/tab_bar_widget.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_actions.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_view_model_cubit.dart';
import 'package:fitness_app/features/meals/presentation/widget/food_item.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsView extends StatefulWidget {
  const MealsView({Key? key}) : super(key: key);

  @override
  _MealsViewState createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> with TickerProviderStateMixin {
  MealsViewModelCubit get mealsViewModel => context.read<MealsViewModelCubit>();
  AppCubit get appCubit => context.read<AppCubit>();

  bool isTabControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    debugPrint('Initial selected index: ${appCubit.selectedIndex}');

    // Load meal categories first
    mealsViewModel.doAction(LoadMealsCategories());
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealsViewModelCubit, MealsViewModelState>(
      builder: (context, state) {
        return BaseView(
          child: [
            if (mealsViewModel.categories.isNotEmpty)
              PinnedSliverWidget(
                child: DefaultTabController(
                  initialIndex: appCubit.selectedIndex,
                  length: mealsViewModel.categories.length,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: tabBarWidget(
                      tabs: mealsViewModel.categories
                          .map((item) => Tab(text: item.categoryName))
                          .toList(),
                      onTap: (index) {
                        mealsViewModel.doAction(FilterMealsByCategory(
                          mealsViewModel.categories[index].categoryName,
                        ));
                      },
                      context: context,
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
                        meal: mealsViewModel.meals[index],
                      ),
                    )
                        : FadeInDownBig(
                      child: FoodItem(
                        meal: mealsViewModel.meals[index],
                      ),
                    );
                  },
                  childCount: mealsViewModel.meals.length,
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

            mealsViewModel.doAction(FilterMealsByCategory(
              mealsViewModel.categories[appCubit.selectedIndex].categoryName,
            ));

        }
      },
    );
  }
}
