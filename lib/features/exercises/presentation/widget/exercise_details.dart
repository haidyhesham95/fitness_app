import 'package:fitness_app/core/app_cubit/app_cubit.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/pinned_sliver_widget.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/core/utils/widgets/tab_bar_widget.dart';
import 'package:fitness_app/features/exercises/presentation/viewModel/exercise_action.dart';
import 'package:fitness_app/features/exercises/presentation/viewModel/exercise_view_model_cubit.dart';
import 'package:fitness_app/features/exercises/presentation/widget/cached_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/lang_keys.dart';
import 'border_container_widget.dart';
import 'container_selectable_widget.dart';
import 'icon_video_widget.dart';

class ExerciseDetails extends StatefulWidget {
  final String id,imageUrl, title;

  const ExerciseDetails({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  State<ExerciseDetails> createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {

  String? selectedDifficultyName;
  String? selectedDifficultyId;
  ExerciseViewModelCubit get viewModel=> context.read<ExerciseViewModelCubit>();
  AppCubit get appCubit => context.read<AppCubit>();
  @override
  Widget build(BuildContext context) {
    return PinnedSliverWidget(
      height: context.height * 0.4,
      child:  ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Stack(
          children: [
            CachedNetworkWidget(
              imageUrl: widget.imageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
              height: context.height * 0.4,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: .5),
                    Colors.black.withValues(alpha: .5),
                    Colors.black.withValues(alpha: .4),
                    Colors.black.withValues(alpha: .3),
                    context.colors.transparent,
                    context.colors.transparent,
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            _buildImageInfo(context),
            Positioned(
              bottom: 0.h,
              right: 0.w,
              left: 0.w,
              child:ContainerSelectableWidget(
                child: DefaultTabController(
                  initialIndex: appCubit.selectedIndex,
                  length: viewModel.difficultyLevels.length,
                  child: tabBarWidget(
                    tabs: viewModel.difficultyLevels
                        .map((item) => Tab(text: item.name))
                        .toList(),
                    onTap: (index) {
                      viewModel.doAction(GetExercises(
                          primeMoverMuscleId:widget.id , difficultyLevelId: viewModel.difficultyLevels[index]
                          .id
                      ));
                    },
                    context: context,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageInfo(BuildContext context) {
    return Positioned(
      bottom: 60.h,
      left: 10.w,
      right: 10.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: MyFonts.styleMedium500_24
                    .copyWith(color: context.colors.white),
              ),
              IconVideoWidget(
                onPressed: () {},
              ),
            ],
          ),
          verticalSpacing(8.h),
          Text(
            context.translate(LangKeys.exercisesDescription),
            style: MyFonts.styleRegular400_16
                .copyWith(color: context.colors.white),
          ),
          verticalSpacing(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BorderContainerWidget(
                text: context.translate(LangKeys.thirtyMinutes),
              ),
              BorderContainerWidget(
                  text: context.translate(LangKeys.cal),
                  style: MyFonts.styleBold700_12
                      .copyWith(color: context.colors.baseColor)),
            ],
          )
        ],
      ),
    );
  }
}
