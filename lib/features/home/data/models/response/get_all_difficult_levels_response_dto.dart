import 'package:json_annotation/json_annotation.dart';

part 'get_all_difficult_levels_response_dto.g.dart';

@JsonSerializable()
class GetAllDifficultLevelsResponseDto {
  final String? message;
  final List<GetAllDifficultLevelsResponseDtoLevels?>? levels;

  GetAllDifficultLevelsResponseDto(this.message, this.levels);

  factory GetAllDifficultLevelsResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllDifficultLevelsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllDifficultLevelsResponseDtoToJson(this);
}

@JsonSerializable()
class GetAllDifficultLevelsResponseDtoLevels {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;

  GetAllDifficultLevelsResponseDtoLevels(this.id, this.name);

  factory GetAllDifficultLevelsResponseDtoLevels.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllDifficultLevelsResponseDtoLevelsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllDifficultLevelsResponseDtoLevelsToJson(this);
}
