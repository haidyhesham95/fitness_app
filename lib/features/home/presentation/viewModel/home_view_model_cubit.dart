import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/home/domain/entities/response/get_random_muscles_response_entity.dart';
import 'package:fitness_app/features/home/domain/use_cases/popular_training_use_case.dart';
import 'package:fitness_app/features/home/domain/use_cases/random_execrcises_use_case.dart';
import 'package:fitness_app/features/home/presentation/viewModel/home_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../../workouts/domain/entities/response/get_all_workouts_entity.dart';
import '../../domain/entities/response/get_all_difficult_levels_response_entity.dart';
import '../../domain/entities/response/get_random_exercises_response_entity.dart';
import '../../domain/entities/response/popular_training_entity.dart';
import '../../domain/use_cases/random_muscles_use_case.dart';

part 'home_view_model_state.dart';

@injectable
class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  final RandomMusclesUseCase _getRandomMusclesUseCase;
  final RandomExercisesUseCase _getRandomExercisesUseCase;
  final PopularTrainingUseCase _popularTrainingUseCase;
  List<GetAllDifficultLevelsResponseEntityLevels?> levels = [];
  List<MuscleGroupEntity?>? muscles = [];
  List<PopularTrainingEntity> popularTrainingItems = [];
  int selectedIndex = 0;

  HomeViewModelCubit(this._getRandomMusclesUseCase,
      this._getRandomExercisesUseCase, this._popularTrainingUseCase)
      : super(HomeViewModelInitial());
  List<GetRandomExercisesResponseEntityExercises?> randomExercises =
      []; // exercises
  GetRandomMusclesResponseEntity randomMusclesEntity =
      GetRandomMusclesResponseEntity(
    [],
  );

  void doAction(HomeAction action) {
    switch (action) {
      case GetRandomMuscles():
        _getRandomMuscles();
        break;

      case GetRandomExercises():
        _getRandomExercises();
        break;
      case GetPopularTraining():
        _getPopularTrainingItems();
        break;
    }
  }

  Future<void> _getRandomMuscles() async {
    emit(GetRandomMusclesLoading());
    final result = await _getRandomMusclesUseCase.getRandomMuscles();
    switch (result) {
      case Success<GetRandomMusclesResponseEntity>():
        randomMusclesEntity = result.data;
        debugPrint('Recommendation To Day ${randomMusclesEntity.muscles}');

        emit(GetRandomMusclesSuccess(result.data));
        break;
      case Fail<GetRandomMusclesResponseEntity>():
        emit(GetRandomMusclesError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }

  Future<void> _getRandomExercises() async {
    emit(GetRandomExercisesLoading());
    final result = await _getRandomExercisesUseCase.getRandomExercises();
    switch (result) {
      case Success<GetRandomExercisesResponseEntity>():
        randomExercises = result.data.exercises ?? [];

        emit(GetRandomExercisesSuccess(result.data));
        break;
      case Fail<GetRandomExercisesResponseEntity>():
        emit(GetRandomExercisesError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }

  Future<void> _getPopularTrainingItems() async {
    emit(GetPopularTrainingLoading());
    final result = await _popularTrainingUseCase.getPopularTraining();
    popularTrainingItems = result;

    debugPrint("popular training view model result : ${result.map(
      (e) =>
          "${e.levelName} -- ${e.muscleName} -- ${e.image} -- ${e.muscleId} -- ${e.levelId} ",
    )}");
    debugPrint("popular training view model : ${popularTrainingItems.map(
      (e) =>
          "${e.levelName} -- ${e.muscleName} -- ${e.image} -- ${e.muscleId} -- ${e.levelId} ",
    )}");
    emit(GetPopularTrainingSuccess(result));
  }


}
