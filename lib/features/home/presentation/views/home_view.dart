import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/base_view.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/features/home/presentation/widgets/muscles_section.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_view_model_cubit.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/lang_keys.dart';
import '../widgets/category_section.dart';
import '../widgets/home_loading_widget.dart';
import '../widgets/meals_section.dart';
import '../widgets/popular_training.dart';
import '../widgets/workout_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
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
                const SliverToBoxAdapter(child: CategorySection()),
                const SliverToBoxAdapter(child: MusclesSection()),
                SliverToBoxAdapter(child: verticalSpacing(24.h)),
                const SliverToBoxAdapter(child: WorkoutSection()),
                SliverToBoxAdapter(child: verticalSpacing(24.h)),
                const SliverToBoxAdapter(
                  child: MealsSection(),
                ),
                const SliverToBoxAdapter(child: PopularTraining()),
              ],
            );
          case getProfileLoading():
            return const HomeLoadingWidget();
          default:
            null;
        }
        return const SizedBox();
      },
    );
  }
}
