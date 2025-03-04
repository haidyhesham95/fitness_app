import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';
@JsonSerializable()
class ProfileResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final ProfileUserDto? user;

  ProfileResponseDto ({
    this.message,
    this.user,
  });

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ProfileResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileResponseDtoToJson(this);
  }
}

@JsonSerializable()
class ProfileUserDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "age")
  final int? age;
  @JsonKey(name: "weight")
  final int? weight;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "activityLevel")
  final String? activityLevel;
  @JsonKey(name: "goal")
  final String? goal;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  ProfileUserDto ({
    this.Id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
    this.photo,
    this.createdAt,
  });

  factory ProfileUserDto.fromJson(Map<String, dynamic> json) {
    return _$ProfileUserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileUserDtoToJson(this);
  }
}


