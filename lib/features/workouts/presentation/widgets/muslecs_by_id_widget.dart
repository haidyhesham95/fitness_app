import 'package:fitness_app/core/networking/common/register_context_module.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/generic/widgets/generic_grid_view.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_actions.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_states.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:fitness_app/core/localization/lang_keys.dart';

class MusclesByIdWidget extends StatefulWidget {
  const MusclesByIdWidget({super.key});

  @override
  State<MusclesByIdWidget> createState() => _MusclesByIdWidgetState();
}

class _MusclesByIdWidgetState extends State<MusclesByIdWidget> {
  int selectedIndex = 0;
  String image = '';
  String name = '';
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkoutsViewModelCubit>();
    return Expanded(
      child: BlocBuilder<WorkoutsViewModelCubit, WorkoutsViewModelState>(
        builder: (context, state) {
          if (state is GetWorkoutsByIdSuccess) {
            cubit.dataById = state.data.muscles!
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
            create: (context) => getIt.get<WorkoutsViewModelCubit>()
              ..doAction(GetWorkoutsById()),
            child: BlocBuilder<WorkoutsViewModelCubit, WorkoutsViewModelState>(
              builder: (context, state) {
                if (state is GetWorkoutsByIdSuccess) {
                  cubit.dataById = state.data.muscles ?? [];
                  if (cubit.dataById!.isNotEmpty &&
                      selectedIndex < cubit.dataById!.length) {
                    name = cubit.dataById![selectedIndex].name ??
                        context.translate(LangKeys.highChest);
                    image = cubit.dataById![selectedIndex].image ??
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
    );
  }
}
