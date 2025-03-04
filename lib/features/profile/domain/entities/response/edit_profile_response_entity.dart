import 'package:equatable/equatable.dart';

class EditProfileResponseEntity extends Equatable {
  final String? message;
  final UserEntity? user;
  final String? token;


  const EditProfileResponseEntity({
    this.message,
    this.user,
    this.token
  });

  @override
  List<Object?> get props => [message, user];
}

class UserEntity extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final int? age;
  final int? weight;
  final int? height;
  final String? activityLevel;
  final String? goal;
  final String? photo;
  final String? createdAt;
  final String? passwordResetCode;
  final String? passwordResetExpires;
  final bool? resetCodeVerified;
  final String? passwordChangedAt;

  const UserEntity({
    this.id,
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
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
    this.passwordChangedAt,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json["_id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      gender: json["gender"],
      age: json["age"],
      weight: json["weight"],
      height: json["height"],
      activityLevel: json["activityLevel"],
      goal: json["goal"],
      photo: json["photo"],
      createdAt: json["createdAt"],
      passwordResetCode: json["passwordResetCode"],
      passwordResetExpires: json["passwordResetExpires"],
      resetCodeVerified: json["resetCodeVerified"],
      passwordChangedAt: json["passwordChangedAt"],
    );
  }
  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    gender,
    age,
    weight,
    height,
    activityLevel,
    goal,
    photo,
    createdAt,
    passwordResetCode,
    passwordResetExpires,
    resetCodeVerified,
    passwordChangedAt,
  ];
}
