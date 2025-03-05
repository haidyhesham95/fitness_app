import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_dto.g.dart';

@JsonSerializable()
class EditProfileRequestDto {
  @JsonKey(name: "lastName")
  final String? lastName;

  EditProfileRequestDto ({
    this.lastName,
  });

  factory EditProfileRequestDto.fromJson(Map<String, dynamic> json) {
    return _$EditProfileRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditProfileRequestDtoToJson(this);
  }
}


