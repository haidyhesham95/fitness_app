import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/networking/common/register_context_module.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/core/utils/widgets/base/snack_bar.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_actions.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_states.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_view_model.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/all_muscles_widgetdart';
import 'package:fitness_app/features/workouts/presentation/widgets/muslecs_by_id_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsView extends StatefulWidget {
  WorkoutsView({super.key});

  @override
  _WorkoutsViewState createState() => _WorkoutsViewState();
}

class _WorkoutsViewState extends State<WorkoutsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            getIt.get<WorkoutsViewModelCubit>()..doAction(GetAllWorkouts()),
        child: BlocBuilder<WorkoutsViewModelCubit, WorkoutsViewModelState>(
          builder: (context, state) {
            final cubit = context.read<WorkoutsViewModelCubit>();
            switch (state) {
              case GetAllWorkoutsViewModelInitial():
              case GetAllWorkoutsLoading():
                return const Center(child: AppLoader());
              case GetAllWorkoutsSuccess():
                cubit.data = state.data.musclesGroup!
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
                cubit.dataById = state.data.muscles!
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
            return Column(
              children: [AllMusclesList(), const MusclesByIdWidget()],
            );
          },
        ),
      ),
    );
  }
}
