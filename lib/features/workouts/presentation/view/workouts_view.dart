import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/networking/common/register_context_module.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/core/utils/widgets/base/snack_bar.dart';
import 'package:fitness_app/features/generic/widgets/app_bar.dart';
import 'package:fitness_app/features/generic/widgets/generic_grid_view.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_actions.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_states.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_view_model.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/selector_card.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutsView extends StatefulWidget {
  WorkoutsView({super.key});

  @override
  _WorkoutsViewState createState() => _WorkoutsViewState();
}

class _WorkoutsViewState extends State<WorkoutsView> {
  int selectedIndex = 0;
  String image = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            getIt.get<WorkoutsViewModelCubit>()..doAction(GetAllWorkouts()),
        child: BlocBuilder<WorkoutsViewModelCubit, WorkoutsViewModelState>(
          builder: (context, state) {
            List<MuscleGroupEntity>? data = [];
            List<MuscleEntity>? dataById = [];
            switch (state) {
              case GetAllWorkoutsViewModelInitial():
              case GetAllWorkoutsLoading():
                return const Center(child: AppLoader());
              case GetAllWorkoutsSuccess():
                data = state.data.musclesGroup!
                    .map((e) => MuscleGroupEntity(id: e.id, name: e.name))
                    .toList();
              case GetAllWorkoutsError():
                aweSnackBar(
                    msg: context.translate(LangKeys.error),
                    context: context,
                    type: MessageTypeConst.failure);
              case GetWorkoutsByIdViewModelInitial():
              case GetWorkoutsByIdLoading():
                return const Center(child: AppLoader());
              case GetWorkoutsByIdSuccess():
                dataById = state.data.muscles!
                    .map(
                      (e) => MuscleEntity(
                        id: e.id,
                        name: e.name,
                        image: e.image,
                      ),
                    )
                    .toList();
              case GetWorkoutsByIdError():
                aweSnackBar(
                    msg: context.translate(LangKeys.error),
                    context: context,
                    type: MessageTypeConst.failure);
            }
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesEditBg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  FitnessAppBar(
                    title: context.translate(LangKeys.workouts),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 60.h,
                      child: data.isEmpty
                          ? const Center(
                              child: Text("",
                                  style: TextStyle(color: Colors.white)))
                          : ListView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: buildCategory(
                                    data![index].name ?? '',
                                    context,
                                    isSelected: selectedIndex == index,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<WorkoutsViewModelCubit,
                        WorkoutsViewModelState>(
                      builder: (context, state) {
                        if (state is GetWorkoutsByIdSuccess) {
                          dataById = state.data.muscles!
                              .map(
                                (e) => MuscleEntity(
                                  id: e.id,
                                  name: e.name,
                                  image: e.image,
                                ),
                              )
                              .toList();
                        }
                        return BlocProvider(
                          create: (context) =>
                              getIt.get<WorkoutsViewModelCubit>()
                                ..doAction(GetWorkoutsById()),
                          child: BlocBuilder<WorkoutsViewModelCubit,
                              WorkoutsViewModelState>(
                            builder: (context, state) {
                              if (state is GetWorkoutsByIdSuccess) {
                                dataById = state.data.muscles ?? [];
                                if (dataById!.isNotEmpty &&
                                    selectedIndex < dataById!.length) {
                                  name = dataById![selectedIndex].name ??
                                      context.translate(LangKeys.highChest);
                                  image = dataById![selectedIndex].image ??
                                      '${Assets.imagesMuscles}';
                                } else {
                                  name = context.translate(LangKeys.highChest);
                                  image = '${Assets.imagesMuscles}';
                                }
                              }
                              return GenericGridView(
                                image,
                                name,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
