import 'package:json_annotation/json_annotation.dart';

part 'get_random_muscles_response_dto.g.dart';

@JsonSerializable()
class GetRandomMusclesResponseDto {
  final String? message;
  final int? totalMuscles;
  final List<GetRandomMusclesResponseDtoMuscles?>? muscles;

  GetRandomMusclesResponseDto(this.message, this.totalMuscles, this.muscles);

  factory GetRandomMusclesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetRandomMusclesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetRandomMusclesResponseDtoToJson(this);
}

@JsonSerializable()
class GetRandomMusclesResponseDtoMuscles {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? image;

  GetRandomMusclesResponseDtoMuscles(this.id, this.name, this.image);

  factory GetRandomMusclesResponseDtoMuscles.fromJson(
          Map<String, dynamic> json) =>
      _$GetRandomMusclesResponseDtoMusclesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetRandomMusclesResponseDtoMusclesToJson(this);
}
