import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/home/domain/entities/response/get_random_muscles_response_entity.dart';
import 'package:fitness_app/features/home/domain/use_cases/random_execrcises_use_case.dart';
import 'package:fitness_app/features/home/presentation/viewModel/home_action.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../domain/entities/response/get_random_exercises_response_entity.dart';
import '../../domain/use_cases/random_muscles_use_case.dart';

part 'home_view_model_state.dart';

@injectable
class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  final RandomMusclesUseCase _getRandomMusclesUseCase;
  final RandomExercisesUseCase _getRandomExercisesUseCase;

  HomeViewModelCubit(this._getRandomMusclesUseCase,
      this._getRandomExercisesUseCase)
      : super(HomeViewModelInitial());

  void doAction(HomeAction action) {
    switch (action) {
      case GetRandomMuscles():
        _getRandomMuscles();
        break;

      case GetRandomExercises():
        _getRandomExercises();
        break;
    }
  }

  Future<void> _getRandomMuscles() async {
    emit(GetRandomMusclesLoading());
    final result = await _getRandomMusclesUseCase.getRandomMuscles();
    switch (result) {
      case Success<GetRandomMusclesResponseEntity>():
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
        emit(GetRandomExercisesSuccess(result.data));
        break;
      case Fail<GetRandomExercisesResponseEntity>():
        emit(GetRandomExercisesError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }
}
