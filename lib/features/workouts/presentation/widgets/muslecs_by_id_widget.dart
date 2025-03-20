import 'package:fitness_app/core/networking/common/register_context_module.dart';
import 'package:fitness_app/features/generic/widgets/generic_grid_view.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_actions.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_states.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusclesByIdWidget extends StatefulWidget {
  const MusclesByIdWidget({super.key});

  @override
  State<MusclesByIdWidget> createState() => _MusclesByIdWidgetState();
}

class _MusclesByIdWidgetState extends State<MusclesByIdWidget> {
  int selectedIndex = 0;
  String image = '';
  String name = '';
  String id = '';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkoutsViewModelCubit>();
    return Expanded(
      child: BlocBuilder<WorkoutsViewModelCubit, WorkoutsViewModelState>(
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt.get<WorkoutsViewModelCubit>()
              ..doAction(GetWorkoutsById(cubit.dataById[0].id ?? '')),
            child: BlocBuilder<WorkoutsViewModelCubit, WorkoutsViewModelState>(
              builder: (context, state) {
                if (state is GetWorkoutsByIdSuccess) {
                  cubit.dataById = state.data.muscles ?? [];
                  if (cubit.dataById.isNotEmpty &&
                      selectedIndex < cubit.dataById.length) {
                    image = cubit.dataById[selectedIndex].image ?? '';
                    name = cubit.dataById[selectedIndex].name ?? '';
                    id = cubit.dataById[selectedIndex].id ?? '';
                  }
                }
                return GenericGridView(image, name, id);
              },
            ),
          );
        },
      ),
    );
  }
}
