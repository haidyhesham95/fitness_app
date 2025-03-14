import 'package:equatable/equatable.dart';

class MusclesByIdResponseEntity extends Equatable {
  final String? message;
  final MuscleGroupEntityById? muscleGroup;
  final List<MuscleEntity>? muscles;

  const MusclesByIdResponseEntity({
    this.message,
    this.muscleGroup,
    this.muscles,
  });

  factory MusclesByIdResponseEntity.fromJson(Map<String, dynamic> json) {
    return MusclesByIdResponseEntity(
      message: json["message"],
      muscleGroup: json["muscleGroup"] != null
          ? MuscleGroupEntityById.fromJson(json["muscleGroup"])
          : null,
      muscles: json["muscles"] != null
          ? (json["muscles"] as List)
              .map((muscle) => MuscleEntity.fromJson(muscle))
              .toList()
          : null,
    );
  }

  @override
  List<Object?> get props => [message, muscleGroup, muscles];
}

class MuscleGroupEntityById extends Equatable {
  final String? id;
  final String? name;

  const MuscleGroupEntityById({
    this.id,
    this.name,
  });

  factory MuscleGroupEntityById.fromJson(Map<String, dynamic> json) {
    return MuscleGroupEntityById(
      id: json["_id"],
      name: json["name"],
    );
  }

  @override
  List<Object?> get props => [id, name];
}

class MuscleEntity extends Equatable {
  final String? id;
  final String? name;
  final String? image;

  const MuscleEntity({
    this.id,
    this.name,
    this.image,
  });

  factory MuscleEntity.fromJson(Map<String, dynamic> json) {
    return MuscleEntity(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
    );
  }

  @override
  List<Object?> get props => [id, name, image];
}
