import 'package:fitness_app/features/home/domain/entities/response/get_random_exercises_response_entity.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/response/get_meals_categories_response_entity.dart';
import '../entities/response/get_random_muscles_response_entity.dart';

abstract interface class HomeRepo {
  Future<DataResult<GetRandomMusclesResponseEntity>> getRandomMuscles();

  Future<DataResult<GetMealsCategoriesResponseEntity>> getMealsCategories();

  Future<DataResult<GetRandomExercisesResponseEntity>> getRandomExercises();
}
