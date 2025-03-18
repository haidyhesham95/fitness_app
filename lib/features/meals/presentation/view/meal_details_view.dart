import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/core/utils/widgets/base/base_view.dart';
import 'package:fitness_app/core/utils/widgets/pinned_sliver_widget.dart';
import 'package:fitness_app/di/di.dart';
import 'package:fitness_app/features/meals/presentation/provider/youtube_player_provider.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_actions.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_view_model_cubit.dart';
import 'package:fitness_app/features/meals/presentation/widget/food_item.dart';
import 'package:fitness_app/features/meals/presentation/widget/food_video_widget.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:provider/provider.dart';

class MealDetailsView extends StatefulWidget {
  final String mealId;

  const MealDetailsView({Key? key, required this.mealId}) : super(key: key);

  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  final MealsViewModelCubit viewModel = getIt.get<MealsViewModelCubit>();

  void initState() {
    debugPrint(' current category ${viewModel.currentCategory}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealsViewModelCubit, MealsViewModelState>(
      buildWhen: (previous, current) =>
          previous != current && current is MealInfoSuccess,
      builder: (context, state) {
        return state is MealInfoSuccess
            ? BaseView(
                extendBodyBehindAppBar: true,
                child: [
                  PinnedSliverWidget(
                    height: context.height * 0.4,
                    child: ChangeNotifierProvider(
                      create: (context) => YoutubePlayerProvider()..initialize(state.mealDetailsEntity.youtube),
                      child: FoodVideoWidget(
                            videoUrl: state.mealDetailsEntity.youtube,
                            imageUrl: state.mealDetailsEntity.image,
                            title: state.mealDetailsEntity.name,
                            description: state.mealDetailsEntity.instructions),
                    ),
                    ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: 16.0.w, left: 16.h, top: 16.h),
                      child: Text(
                        context.translate(LangKeys.ingredients),
                        style: MyFonts.styleBold700_20
                            .copyWith(color: context.colors.white),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GlassContainer(
                        blur: 30,
                        shadowStrength: 5,
                        shadowColor: const Color(0xFF2D2D2D),
                        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Row(
                              verticalDirection: VerticalDirection.up,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.mealDetailsEntity.ingredients[index]
                                      .toString(),
                                  style: MyFonts.styleSemiBold600_16
                                      .copyWith(color: context.colors.white),
                                ),
                                Text(
                                  state.mealDetailsEntity.measures[index]
                                      .toString(),
                                  style: MyFonts.styleRegular400_12.copyWith(
                                      color: context.colors.baseColor),
                                ),
                              ],
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                height: 5,
                                color: context.colors.bgColor,
                              );
                            },
                            itemCount:
                                state.mealDetailsEntity.ingredients.length,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: 16.0.w, left: 16.h, top: 16.h),
                      child: Text(
                        context.translate(LangKeys.recommendation),
                        style: MyFonts.styleMedium500_20
                            .copyWith(color: context.colors.white),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child:
                        BlocBuilder<MealsViewModelCubit, MealsViewModelState>(
                      builder: (context, state) {
                        if (state is RandomMealsSuccess) {
                          return InkWell(
                            onTap: () {
                              Provider.of<YoutubePlayerProvider>(context, listen: false)
                                  .disposeController();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                height: 160.h,
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => SizedBox(
                                    height: 160.h,
                                    width: 160.w,
                                    child: FoodItem(
                                      meal: state.randomMeals[index],
                                    ),
                                  ),
                                  itemCount: state.randomMeals.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) => SizedBox(
                                    width: 10.w,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return const Center(child: AppLoader());
                      },
                    ),
                  ),
                ],
                image: Assets.imagesMealBg,
                isArrowBackShow: true,
              )
            : const Center(
                child: AppLoader(),
              );
      },
      listener: (context, state) {
        if (state is MealInfoSuccess) {
          viewModel.doAction(
              FilterMealsByCategory(state.mealDetailsEntity.category));
        }
      },
    );
  }
}
