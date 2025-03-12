import '../../domain/entities/response/get_meals_categories_response_entity.dart';
import '../../domain/entities/response/get_random_muscles_response_entity.dart';
import '../models/response/get_meals_categories_response_dto.dart';
import '../models/response/get_random_muscles_response_dto.dart';

class HomeMapper {
  static GetRandomMusclesResponseEntity mapRandomMusclesToEntity(
      GetRandomMusclesResponseDto dto) {
    return GetRandomMusclesResponseEntity(
      dto.muscles
          ?.map((muscle) => muscle == null
              ? null
              : GetRandomMusclesResponseEntityMuscles(
                  muscle.id, muscle.name, muscle.image))
          .toList(),
    );
  }

  static GetMealsCategoriesResponseEntity mapMealsCategoriesToEntity(
      GetMealsCategoriesResponseDto dto) {
    return GetMealsCategoriesResponseEntity(
      dto.categories
          ?.map((category) => category == null
              ? null
              : GetMealsCategoriesResponseEntityCategories(
                  category.idCategory,
                  category.strCategory,
                  category.strCategoryThumb,
                  category.strCategoryDescription,
                ))
          .toList(),
    );
  }
}
