import 'package:equatable/equatable.dart';

class AllMusclesResponseEntity extends Equatable {
  final String? message;
  final List<MuscleGroupEntity>? musclesGroup;

  const AllMusclesResponseEntity({
    this.message,
    this.musclesGroup,
  });

  factory AllMusclesResponseEntity.fromJson(Map<String, dynamic> json) {
    return AllMusclesResponseEntity(
      message: json["message"],
      musclesGroup: json["musclesGroup"] != null
          ? (json["musclesGroup"] as List)
              .map((muscleGroup) => MuscleGroupEntity.fromJson(muscleGroup))
              .toList()
          : null,
    );
  }

  @override
  List<Object?> get props => [message, musclesGroup];
}

class MuscleGroupEntity extends Equatable {
  final String? id;
  final String? name;

  const MuscleGroupEntity({
    this.id,
    this.name,
  });

  factory MuscleGroupEntity.fromJson(Map<String, dynamic> json) {
    return MuscleGroupEntity(
      id: json["_id"],
      name: json["name"],
    );
  }

  @override
  List<Object?> get props => [id, name];
}
