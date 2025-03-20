import 'package:json_annotation/json_annotation.dart';

part 'get_all_workout_by_id_dto.g.dart';

@JsonSerializable()
class GetAllWorkoutsByIdDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "muscleGroup")
  final MuscleGroup? muscleGroup;
  @JsonKey(name: "muscles")
  final List<Muscles>? muscles;

  GetAllWorkoutsByIdDto ({
    this.message,
    this.muscleGroup,
    this.muscles,
  });

  factory GetAllWorkoutsByIdDto.fromJson(Map<String, dynamic> json) {
    return _$GetAllWorkoutsByIdDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllWorkoutsByIdDtoToJson(this);
  }
}

@JsonSerializable()
class MuscleGroup {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;

  MuscleGroup ({
    this.id,
    this.name,
  });

  factory MuscleGroup.fromJson(Map<String, dynamic> json) {
    return _$MuscleGroupFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MuscleGroupToJson(this);
  }
}

@JsonSerializable()
class Muscles {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "image")
  final String? image;

  Muscles ({
    this.Id,
    this.name,
    this.image,
  });

  factory Muscles.fromJson(Map<String, dynamic> json) {
    return _$MusclesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusclesToJson(this);
  }
}


