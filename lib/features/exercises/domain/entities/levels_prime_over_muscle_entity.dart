class LevelsPrimeMoverMuscleEntity {
  final String message;
  final int totalLevels;
  final List<DifficultyLevel> difficultyLevels;

  LevelsPrimeMoverMuscleEntity({
    required this.message,
    required this.totalLevels,
    required this.difficultyLevels,
  });
}

class DifficultyLevel {
  final String id;
  final String name;

  DifficultyLevel({
    required this.id,
    required this.name,
  });
}
