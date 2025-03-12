import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/base_view.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/features/home/presentation/models/category_container_model.dart';
import 'package:fitness_app/features/home/presentation/widgets/recommendation_section.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/localization/lang_keys.dart';
import '../../../../core/networking/common/register_context_module.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../profile/presentation/view_model/profile_actions.dart';
import '../widgets/custom_container_category.dart';
import '../widgets/home_loading_widget.dart';
import '../widgets/popular_training_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryContainerModel> items = [
      CategoryContainerModel(
        image: Assets.imagesGymH,
        title: context.translate(LangKeys.gym),
      ),
      CategoryContainerModel(
        image: Assets.imagesFitnessH,
        title: context.translate(LangKeys.fitness),
      ),
      CategoryContainerModel(
        image: Assets.imagesYogaH,
        title: context.translate(LangKeys.yoga),
      ),
      CategoryContainerModel(
        image: Assets.imagesAerobicsH,
        title: context.translate(LangKeys.aerobics),
      ),
      CategoryContainerModel(
        image: Assets.imagesTrainerH,
        title: context.translate(LangKeys.trainer),
      ),
    ];
    return BlocProvider(
      create: (context) =>
          getIt.get<ProfileViewModelCubit>()..doAction(GetUserData()),
      child: BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
        builder: (context, state) {
          switch (state) {
            case getProfileSuccess():
              return BaseView(
                image: Assets.imagesHomeBg,
                isArrowBackShow: false,
                title:
                    '${context.translate(LangKeys.hi)}  ${state.data.user!.firstName},',
                subTitle: context.translate(LangKeys.letsStartYourDay),
                child: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpacing(24.h),
                          Text(
                            "Categories",
                            style: MyFonts.styleSemiBold600_16
                                .copyWith(color: context.colors.white),
                          ),
                          verticalSpacing(7.h),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: context.colors.darkGray,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: SizedBox(
                              height: 116.h,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: items.length,
                                itemBuilder: (context, index) => FadeInRight(
                                  child: CustomContainerCategory(
                                      model: items[index]),
                                ),
                                separatorBuilder: (context, index) =>
                                    VerticalDivider(
                                  endIndent: 20,
                                  indent: 20,
                                  color: context.colors.gray,
                                ),
                              ),
                            ),
                          ),
                          verticalSpacing(24.h),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: FadeInLeft(
                      child: const RecommendationSection(
                          title: 'Recommendation To Day'),
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpacing(24.h)),
                  SliverToBoxAdapter(
                    child: FadeInRight(
                      child: const RecommendationSection(
                          title: 'Upcoming Workouts', showSeeAll: true),
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpacing(24.h)),
                  SliverToBoxAdapter(
                    child: FadeInLeft(
                      child: const RecommendationSection(
                          title: 'Recommendation For You', showSeeAll: true),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: PopularTrainingSection(),
                  )
                ],
              );
            case getProfileLoading():
              return const HomeLoadingWidget();
            default:
              null;
          }
          return const SizedBox();
        },
      ),
    );
  }
}
