import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/features/home/presentation/widgets/recommendation_section.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../meals/presentation/widget/tab_bar_widget.dart';
import '../../../workouts/presentation/view_model/workouts_states.dart';
import '../../../workouts/presentation/view_model/workouts_view_model.dart';
import 'home_loading_widget.dart';

class WorkoutSection extends StatefulWidget {
  const WorkoutSection({super.key});

  @override
  State<WorkoutSection> createState() => _WorkoutSectionState();
}

class _WorkoutSectionState extends State<WorkoutSection> {
  WorkoutsViewModelCubit get viewModel =>
      context.read<WorkoutsViewModelCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutsViewModelCubit, WorkoutsViewModelState>(
      builder: (context, state) {
        return DefaultTabController(
          length: viewModel.musclesGroup.length,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: tabBarWidget(
                  tabs: [
                    ...viewModel.musclesGroup
                        .map((item) => Tab(text: item.name ?? "No Name")),
                  ],
                  onTap: (index) {
                    viewModel.doAction(GetWorkoutsById(
                        viewModel.musclesGroup[index].id ?? ""));
                  },
                  context: context,
                ),
              ),
              SizedBox(
                  height: 120.h,
                  child: TabBarView(
                    children: viewModel.musclesGroup.map((muscle) {
                          return Center(
                            child: BlocBuilder<WorkoutsViewModelCubit,
                                    WorkoutsViewModelState>(
                                builder: (context, state) {
                              switch (state) {
                                case GetWorkoutsByIdLoading():
                                  return const HomeLoadingWidget();
                                case GetWorkoutsByIdSuccess():
                                  return FadeInLeft(
                                    child: RecommendationSection(
                                        data: state.data.muscles ?? [],
                                        title: "Upcoming Workouts"),
                                  );
                                case GetWorkoutsByIdError():
                                  return Center(
                                    child: Text(state.errorMessage.error ?? ""),
                                  );
                                default:
                                  null;
                              }
                              return const SizedBox();
                            }),
                          );
                        }).toList() ??
                        [],
                  )),
            ],
          ),
        );
        return const SizedBox();
      },
      listener: (context, state) {
        if (state is GetAllWorkoutsSuccess) {
          context
              .read<WorkoutsViewModelCubit>()
              .doAction(GetWorkoutsById(viewModel.musclesGroup[0].id ?? ""));
        }
      },
    );
  }
}
