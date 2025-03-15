import 'package:equatable/equatable.dart';

class AllMusclesResponseEntity extends Equatable {
  final String? message;
  final List<MuscleGroupEntity>? musclesGroup;

  const AllMusclesResponseEntity({
    this.message,
    this.musclesGroup,
  });

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

  @override
  List<Object?> get props => [id, name];
}
