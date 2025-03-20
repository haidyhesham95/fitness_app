import 'package:fitness_app/features/workouts/data/models/response/get_all_workout_by_id_dto.dart';
import 'package:fitness_app/features/workouts/data/models/response/muscles_by_muscle_group_id_dto.dart';
import 'package:fitness_app/features/workouts/data/models/response/workouts_response_dto.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/muscles_by_muscle_group_id_entity.dart';

class WorkoutsMapper {
  static AllMusclesResponseEntity toEntity(WorkoutsResponseDto response) {
    if(response.musclesGroup == null) return const AllMusclesResponseEntity(musclesGroup: [], message: '');
    return AllMusclesResponseEntity(
      message: response.message ?? '',
      musclesGroup: response.musclesGroup!.map((e) => toWorkoutsEntity(e)).toList(),
    );
  }

  static MuscleGroupEntity toWorkoutsEntity(MusclesGroup workouts) {
    return MuscleGroupEntity(
      id: workouts.id ?? '',
      name: workouts.name ?? '',
    );
  }

  static MusclesByIdResponseEntity toEntityById(
      GetAllWorkoutsByIdDto response) {
    return MusclesByIdResponseEntity(
      message: response.message,
      muscleGroup: response.muscleGroup != null
          ? MuscleGroupEntityById(
              id: response.muscleGroup!.id,
              name: response.muscleGroup!.name,
            )
          : null,
      muscles: response.muscles != null
          ? response.muscles!.map((e) => toMuscleEntity(e)).toList()
          : null,
    );
  }

  static MuscleEntity toMuscleEntity(Muscles workouts) {
    return MuscleEntity(
      id: workouts.Id,
      name: workouts.name,
      image: workouts.image,
    );
  }

  static List<MusclesByMuscleGroupIdEntity> toEntityByMuscleGroupId(
      MusclesByMuscleGroupIdResponseDto response) {
    if (response.muscles == null) return [];
    return response.muscles!
        .map((e) => MusclesByMuscleGroupIdEntity(
              id: e!.id.toString() ,
              name: e.name ?? '',
              image: e.image ?? '',
            ))
        .toList();
  }
}
