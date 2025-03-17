sealed class WorkoutsActions {}

class GetAllWorkouts extends WorkoutsActions {}

class GetWorkoutsById extends WorkoutsActions {
  final String id;

  GetWorkoutsById(this.id);
}
