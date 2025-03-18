import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/features/generic/widgets/generic_card.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/tab_bar_widget.dart';
import '../../../workouts/presentation/view_model/workouts_states.dart';
import '../../../workouts/presentation/view_model/workouts_view_model.dart';

class WorkoutSection extends StatefulWidget {
  const WorkoutSection({super.key});

  @override
  State<WorkoutSection> createState() => _WorkoutSectionState();
}

class _WorkoutSectionState extends State<WorkoutSection> {
  WorkoutsViewModelCubit get viewModel =>
      context.read<WorkoutsViewModelCubit>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      viewModel.doAction(GetAllWorkouts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutsViewModelCubit, WorkoutsViewModelState>(
      builder: (context, state) {
        if (viewModel.muscles.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🏋️ Tab Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: DefaultTabController(
                length: viewModel.muscles.length,
                child: SizedBox(
                  height: 50.h, // Prevents layout issues
                  child: tabBarWidget(
                    tabs: viewModel.muscles
                        .map((item) => Tab(text: item.name))
                        .toList(),
                    onTap: (index) {
                      viewModel.doAction(GetMusclesByMuscleGroupId(
                          viewModel.muscles[index].id ));
                    },
                    context: context,
                  ),
                ),
              ),
            ),

            // 🏋️‍♂️ Workouts Section - Horizontal Scrolling
            SizedBox(
              height: 180.h, // Ensures ListView fits well
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.musclesGroup.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150.w,
                      height: 180.h,
                      padding: EdgeInsets.only(right: 10.w),
                      child: FadeInRight(
                        child: GenericCard(
                          title: viewModel.musclesGroup[index].name,
                          imageUrl: viewModel.musclesGroup[index].image,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is GetAllWorkoutsSuccess) {
          if (viewModel.muscles.isNotEmpty) {
            context.read<WorkoutsViewModelCubit>().doAction(
                GetMusclesByMuscleGroupId(viewModel.muscles[0].id ));
          }
        }
      },
    );
  }
}
