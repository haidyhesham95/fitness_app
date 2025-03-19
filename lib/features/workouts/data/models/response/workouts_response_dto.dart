import 'package:json_annotation/json_annotation.dart';

part 'workouts_response_dto.g.dart';

@JsonSerializable()
class WorkoutsResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "musclesGroup")
  final List<MusclesGroup>? musclesGroup;

  WorkoutsResponseDto ({
    this.message,
    this.musclesGroup,
  });

  factory WorkoutsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$WorkoutsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WorkoutsResponseDtoToJson(this);
  }
}

@JsonSerializable()
class MusclesGroup {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;

  MusclesGroup ({
    this.id,
    this.name,
  });

  factory MusclesGroup.fromJson(Map<String, dynamic> json) {
    return _$MusclesGroupFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusclesGroupToJson(this);
  }
}
