sealed class ExerciseAction {}

class GetExercises extends ExerciseAction {
  final String primeMoverMuscleId, difficultyLevelId;

  GetExercises(
      {required this.primeMoverMuscleId, required this.difficultyLevelId});
}

class GetLevelsPrimeMoverMuscle extends ExerciseAction {
  final String primeMoverMuscleId;

  GetLevelsPrimeMoverMuscle({required this.primeMoverMuscleId});
}

class GetLevelIndex extends ExerciseAction {
  final String levelId;

  GetLevelIndex({required this.levelId});
}