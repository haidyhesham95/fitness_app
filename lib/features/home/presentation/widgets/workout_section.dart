import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../workouts/presentation/view_model/workouts_states.dart';
import '../../../workouts/presentation/view_model/workouts_view_model.dart';
import 'home_loading_widget.dart';

class WorkoutSection extends StatelessWidget {
  const WorkoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsViewModelCubit, WorkoutsViewModelState>(
        builder: (context, state) {
      switch (state) {
        case GetAllWorkoutsLoading():
          return const HomeLoadingWidget();
        case GetAllWorkoutsSuccess():
          return DefaultTabController(
            length: state.data.musclesGroup?.length ?? 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colors.transparent,
                    ),
                    child: TabBar(
                      labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      dividerColor: Colors.transparent,
                      labelColor: context.colors.white,
                      unselectedLabelColor: context.colors.gray,
                      indicator: BoxDecoration(
                        color: context.colors.baseColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      indicatorPadding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: state.data.musclesGroup?.map((muscle) {
                            return Tab(text: muscle.name ?? "No Name");
                          }).toList() ??
                          [],
                    ),
                  ),
                ),
                SizedBox(
                    height: 120.h,
                    // Adjust height based on UI needs
                    child: TabBarView(
                      children: state.data.musclesGroup?.map((muscle) {
                            return Center(
                              child: Text(muscle.name ?? "No Name",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.sp)),
                            );
                          }).toList() ??
                          [],
                    )),
              ],
            ),
          );

        case GetAllWorkoutsError():
          return Container(
            height: 104.h,
            child: Center(
              child: Text(state.errorMessage.error ?? ""),
            ),
          );
        default:
          null;
      }
      return const SizedBox();
    });
  }
}
