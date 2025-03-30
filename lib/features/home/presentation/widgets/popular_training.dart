import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/app_cubit/app_cubit.dart';
import 'package:fitness_app/core/networking/common/register_context_module.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/features/exercises/presentation/viewModel/exercise_action.dart';
import 'package:fitness_app/features/exercises/presentation/viewModel/exercise_view_model_cubit.dart';
import 'package:fitness_app/features/home/presentation/widgets/popular_training_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewModel/home_view_model_cubit.dart';

class PopularTraining extends StatefulWidget {
  const PopularTraining({super.key});

  @override
  State<PopularTraining> createState() => _PopularTrainingState();
}

class _PopularTrainingState extends State<PopularTraining> {
  HomeViewModelCubit get homeVM => context.read<HomeViewModelCubit>();

  ExerciseViewModelCubit get exerciseVM => getIt.get<ExerciseViewModelCubit>();

  AppCubit get appCubit => context.read<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
        builder: (context, state) {
      return FadeInLeft(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "popular training",
              style: MyFonts.styleSemiBold600_16
                  .copyWith(color: context.colors.white),
            ),
            verticalSpacing(8.h),
            SizedBox(
              height: 250.h,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return FadeInRight(
                        child: PopularTrainingWidget(
                      popularTrainingItems: homeVM.popularTrainingItems[index],
                      onTapItem: () {
                        exerciseVM.doAction(
                          GetLevelsPrimeMoverMuscle(
                              primeMoverMuscleId:
                                  homeVM.popularTrainingItems[index].muscleId!),
                        );
                        appCubit.updateIndex(index);

                        exerciseVM.doAction(GetExercises(
                            difficultyLevelId:
                                homeVM.popularTrainingItems[index].levelId!,
                            primeMoverMuscleId:
                                homeVM.popularTrainingItems[index].muscleId!));
                        debugPrint(
                            'muscle id = ${homeVM.popularTrainingItems[index].muscleId}');

                        debugPrint(
                            ' level id = ${homeVM.popularTrainingItems[index].levelId}');

                        debugPrint(
                            'Updated selected index: ${appCubit.selectedIndex}');
                        context.pushNamed(
                          AppRoutes.exerciseView,
                          arguments: {
                            'id': homeVM.popularTrainingItems[index].muscleId,
                            'title':
                                homeVM.popularTrainingItems[index].muscleName,
                            'imageUrl':
                                homeVM.popularTrainingItems[index].image ?? '',
                          },
                        );

                        // exerciseVM.doAction( GetLevelIndex(
                        //   levelId: homeVM.popularTrainingItems[index].levelId!,
                        // ));
                      },
                    ));
                  },
                  separatorBuilder: (context, index) => horizontalSpacing(16.h),
                  itemCount: homeVM.popularTrainingItems.length),
            ),
            verticalSpacing(80)
          ],
        ),
      ));
    });
  }
}
