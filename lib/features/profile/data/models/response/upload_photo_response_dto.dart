import 'package:json_annotation/json_annotation.dart';

part 'upload_photo_response_dto.g.dart';

@JsonSerializable()
class UploadPhotoResponseDto {
  @JsonKey(name: "message")
  final String? message;

  UploadPhotoResponseDto ({
    this.message,
  });

  factory UploadPhotoResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UploadPhotoResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UploadPhotoResponseDtoToJson(this);
  }
}


