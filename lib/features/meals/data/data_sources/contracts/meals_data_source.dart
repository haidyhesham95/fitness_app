import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_details_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meals_category_entity.dart';

abstract interface class MealsDataSource {

  Future<DataResult<List<MealsCategoryEntity>>> getMealsCategories();
  Future<DataResult<List<MealEntity>>> getMealsByCategory(String category);
  Future<DataResult<MealDetailsEntity>> getMealById(String id);
}