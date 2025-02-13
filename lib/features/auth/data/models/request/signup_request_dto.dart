import 'package:json_annotation/json_annotation.dart';
part 'signup_request_dto.g.dart';

@JsonSerializable()
class SignUpRequestDto {
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "weight")
  final int? weight;
  @JsonKey(name: "age")
  final int? age;
  @JsonKey(name: "goal")
  final String? goal;
  @JsonKey(name: "activityLevel")
  final String? activityLevel;

  SignUpRequestDto ({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.goal,
    this.activityLevel,
  });

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) {
    return _$SignUpRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpRequestDtoToJson(this);
  }
}


