import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/home/domain/entities/response/get_random_muscles_response_entity.dart';
import 'package:fitness_app/features/home/domain/use_cases/category_meals_use_case.dart';
import 'package:fitness_app/features/home/presentation/viewModel/home_action.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../domain/entities/response/get_meals_categories_response_entity.dart';
import '../../domain/use_cases/random_muscles_use_case.dart';

part 'home_view_model_state.dart';

@injectable
class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  final RandomMusclesUseCase _getRandomMusclesUseCase;
  final CategoryMealsUseCase _categoryMealsUseCase;

  HomeViewModelCubit(this._getRandomMusclesUseCase, this._categoryMealsUseCase)
      : super(HomeViewModelInitial());

  void doAction(HomeAction action) {
    switch (action) {
      case GetRandomMuscles():
        _getRandomMuscles();
        break;
      case GetMealsCategories():
        _getMealsCategories();
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

  Future<void> _getMealsCategories() async {
    emit(GetMealsCategoriesLoading());
    final result = await _categoryMealsUseCase.getMealsCategories();
    switch (result) {
      case Success<GetMealsCategoriesResponseEntity>():
        emit(GetMealsCategoriesSuccess(result.data));
        break;
      case Fail<GetMealsCategoriesResponseEntity>():
        emit(GetMealsCategoriesError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }
}
