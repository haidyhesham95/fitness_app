import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/core/networking/error/error_handler.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_details_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meals_category_entity.dart';
import 'package:fitness_app/features/meals/domain/use_cases/get_meal_by_id_case.dart';
import 'package:fitness_app/features/meals/domain/use_cases/get_meals_by_category_case.dart';
import 'package:fitness_app/features/meals/domain/use_cases/get_meals_categories_case.dart';
import 'package:injectable/injectable.dart';

import 'meals_actions.dart';

part 'meals_view_model_state.dart';

@injectable
class MealsViewModelCubit extends Cubit<MealsViewModelState> {
  MealsViewModelCubit(
    this._mealsCategories,
    this._getMealsByCategory,
    this._getMealById,
  ) : super(MealsViewModelInitial());

  final GetMealsCategories _mealsCategories;
  final GetMealsByCategoryCase _getMealsByCategory;
  final GetMealByIdCase _getMealById;

  Future<void> doAction(MealsActions action) async {
    switch (action) {
      case LoadMealsCategories():
        _loadMealsCategories();
      case FilterMealsByCategory():
        _filterMealsByCategory(action.category);
      case GetMealInfo():
        _getMealInfo(action.id);
    }
  }

  void _loadMealsCategories() async {
    emit(MealsCategoriesLoading());
    final result = await _mealsCategories();
    switch (result) {
      case Success<List<MealsCategoryEntity>>():
        emit(MealsCategoriesSuccess(result.data));
      case Fail<List<MealsCategoryEntity>>():
        final message = ErrorHandler.handle(result.exception!);

        emit(MealsCategoriesError(message));
    }
  }

  void _filterMealsByCategory(String category) async {
    emit(MealsByCategoryLoading());
    final result = await _getMealsByCategory(category);
    switch (result) {
      case Success<List<MealEntity>>():
        emit(MealsByCategorySuccess(result.data));
      case Fail<List<MealEntity>>():
        final message = ErrorHandler.handle(result.exception!);
        emit(MealsByCategoryError(message));
    }
  }

  void _getMealInfo(String id) async {
    emit(MealInfoLoading());
    final result = await _getMealById(id);
    switch (result) {
      case Success<MealDetailsEntity>():
        emit(MealInfoSuccess(result.data));
      case Fail<MealDetailsEntity>():
        final message = ErrorHandler.handle(result.exception!);
        emit(MealInfoError(message));
    }
  }
}
