import 'package:json_annotation/json_annotation.dart';
part 'signup_response_dto.g.dart';

@JsonSerializable()
class SignUpResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;
  @JsonKey(name: "token")
  final String? token;

  SignUpResponseDto ({
    this.message,
    this.user,
    this.token,
  });

  factory SignUpResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponseDtoFromJson(json);
  }

  get error => null;

  Map<String, dynamic> toJson() {
    return _$SignUpResponseDtoToJson(this);
  }
}

@JsonSerializable()
class UserDto {
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
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  UserDto ({
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
    this.Id,
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }
}


