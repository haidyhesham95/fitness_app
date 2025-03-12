
import 'package:dio/dio.dart';
import 'package:fitness_app/core/networking/api/api_constants.dart';
import 'package:fitness_app/features/meals/data/models/meals_by_category_response_dto.dart';
import 'package:fitness_app/features/meals/data/models/meals_categories_response_dto.dart';
import 'package:fitness_app/features/meals/data/models/meals_details_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'meals_api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.mealsBaseUrl)
abstract class MealsApiManager {
  @factoryMethod
  factory MealsApiManager(Dio dio) = _MealsApiManager;

  @GET(ApiConstants.mealsCategories)
  Future<MealsCategoriesResponseDto> getMealsCategories();

  @GET(ApiConstants.mealsByCategory)
  Future<MealsByCategoryResponseDto> getMealsByCategory(@Query("c") String category);

  @GET(ApiConstants.mealById)
  Future<MealsDetailsResponseDto> getMealById(@Query("i") String id);

}
