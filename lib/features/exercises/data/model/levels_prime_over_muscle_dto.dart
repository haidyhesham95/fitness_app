import 'package:json_annotation/json_annotation.dart';

part 'levels_prime_over_muscle_dto.g.dart';

@JsonSerializable()
class LevelsPrimeOverMuscleDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalLevels")
  final int? totalLevels;
  @JsonKey(name: "difficulty_levels")
  final List<DifficultyLevelsDto>? difficultyLevels;

  LevelsPrimeOverMuscleDto ({
    this.message,
    this.totalLevels,
    this.difficultyLevels,
  });

  factory LevelsPrimeOverMuscleDto.fromJson(Map<String, dynamic> json) {
    return _$LevelsPrimeOverMuscleDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LevelsPrimeOverMuscleDtoToJson(this);
  }
}

@JsonSerializable()
class DifficultyLevelsDto {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;

  DifficultyLevelsDto ({
    this.id,
    this.name,
  });

  factory DifficultyLevelsDto.fromJson(Map<String, dynamic> json) {
    return _$DifficultyLevelsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DifficultyLevelsDtoToJson(this);
  }
}


