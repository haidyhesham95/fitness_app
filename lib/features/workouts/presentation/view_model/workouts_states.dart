import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:flutter/material.dart';
@immutable
sealed class WorkoutsViewModelState {}

class GetAllWorkoutsViewModelInitial extends WorkoutsViewModelState {}

class GetAllWorkoutsLoading extends WorkoutsViewModelState {}

class GetAllWorkoutsSuccess extends WorkoutsViewModelState {
  final AllMusclesResponseEntity data;

  GetAllWorkoutsSuccess({required this.data});
}

class GetAllWorkoutsError extends WorkoutsViewModelState {
  final ErrorModel errorMessage;

  GetAllWorkoutsError({required this.errorMessage});
}
class GetWorkoutsByIdViewModelInitial extends WorkoutsViewModelState {}

class GetWorkoutsByIdLoading extends WorkoutsViewModelState {}

class GetWorkoutsByIdSuccess extends WorkoutsViewModelState {
  final MusclesByIdResponseEntity data;

  GetWorkoutsByIdSuccess({required this.data});
}

class GetWorkoutsByIdError extends WorkoutsViewModelState {
  final ErrorModel errorMessage;

  GetWorkoutsByIdError({required this.errorMessage});
}
