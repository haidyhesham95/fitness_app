import 'package:json_annotation/json_annotation.dart';

part 'muscles_by_muscle_group_id_dto.g.dart';

@JsonSerializable()
class MusclesByMuscleGroupIdResponseDto {
  final String? message;
  final int? totalMuscles;
  final List<MusclesByMuscleGroupIdMusclesDto?>? muscles;

  MusclesByMuscleGroupIdResponseDto(
      this.message, this.totalMuscles, this.muscles);

  factory MusclesByMuscleGroupIdResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$MusclesByMuscleGroupIdResponseDtoFromJson(json);
}

@JsonSerializable()
class MusclesByMuscleGroupIdMusclesDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? image;

  MusclesByMuscleGroupIdMusclesDto(this.id, this.name, this.image);

  factory MusclesByMuscleGroupIdMusclesDto.fromJson(
          Map<String, dynamic> json) =>
      _$MusclesByMuscleGroupIdMusclesDtoFromJson(json);
}
