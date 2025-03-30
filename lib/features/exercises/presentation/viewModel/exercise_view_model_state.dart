import 'package:equatable/equatable.dart';

import '../../../../core/networking/error/error_model.dart';
import '../../domain/entities/exercises_entity.dart';
import '../../domain/entities/levels_prime_over_muscle_entity.dart';

sealed class ExerciseViewModelState extends Equatable {
  const ExerciseViewModelState();

  @override
  List<Object?> get props => [];
}

final class ExerciseViewModelInitial extends ExerciseViewModelState {}

final class ExerciseViewModelLoading extends ExerciseViewModelState {}

final class ExerciseViewModelSuccess extends ExerciseViewModelState {
  final ExercisesEntity data;

  const ExerciseViewModelSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

final class ExerciseViewModelError extends ExerciseViewModelState {
  final ErrorModel errorMessage;

  const ExerciseViewModelError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class LevelsPrimeMoverMuscleSuccess extends ExerciseViewModelState {
  final LevelsPrimeMoverMuscleEntity data;

  const LevelsPrimeMoverMuscleSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

final class LevelsPrimeMoverMuscleError extends ExerciseViewModelState {
  final ErrorModel errorMessage;

  const LevelsPrimeMoverMuscleError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
