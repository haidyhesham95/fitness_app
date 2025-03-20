sealed class WorkoutsActions {}

class GetAllWorkouts extends WorkoutsActions {}

class GetWorkoutsById extends WorkoutsActions {
  final String id;

  GetWorkoutsById(this.id);
}

class GetMusclesByMuscleGroupId extends WorkoutsActions {
  final String id;

  GetMusclesByMuscleGroupId(this.id);
}
