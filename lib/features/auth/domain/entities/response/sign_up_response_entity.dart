import 'package:equatable/equatable.dart';

class SignUpResponseEntity extends Equatable {
  final String? message;
  final String? error;
  final SignUpUser? user;
  final String? token;

  const SignUpResponseEntity({
    this.message,
    this.error,
    this.user,
    this.token,
  });

  @override
  List<Object?> get props => [message, error, user, token];
}

class SignUpUser extends Equatable {
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
  final String? id;
  final String? createdAt;

  const SignUpUser({
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
    this.id,
    this.createdAt,
  });

  @override
  List<Object?> get props => [firstName, lastName, email, gender, age,weight,height,activityLevel,goal, photo, id, createdAt];
}
