import 'package:fitness_app/features/meals/data/models/meals_by_category_response_dto.dart';
import 'package:fitness_app/features/meals/data/models/meals_categories_response_dto.dart';
import 'package:fitness_app/features/meals/data/models/meals_details_response_dto.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_details_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meals_category_entity.dart';

class MealsDtoMapper {
  static List<MealsCategoryEntity> toMealsCategoryEntity(
      MealsCategoriesResponseDto model) {
    if (model.categories == null) return [];
    return model.categories!
        .map((e) => e != null
            ? MealsCategoryEntity(
                categoryName: e.strCategory ?? '',
                categoryImage: e.strCategoryThumb ?? '')
            : MealsCategoryEntity(
                categoryName: e?.strCategory ?? '',
                categoryImage: e?.strCategoryThumb ?? ''))
        .toList();
  }

  static List<MealEntity> toMealsEntity(MealsByCategoryResponseDto model) {
    if (model.meals == null) return [];
    return model.meals!
        .map((e) => e != null
            ? MealEntity(
                mealName: e.strMeal ?? '',
                mealImageUrl: e.strMealThumb ?? '',
                mealId: e.idMeal ?? '')
            : MealEntity(
                mealName: e?.strMeal ?? '',
                mealImageUrl: e?.strMealThumb ?? '',
                mealId: e?.idMeal ?? '',
              ))
        .toList();
  }

  static MealDetailsEntity toMealDetailsEntity(MealsDetailsResponseDto model) {
    return MealDetailsEntity(
      image: model.meals!.first!.strMealThumb ?? '',
      name: model.meals!.first!.strMeal ?? '',
      instructions: model.meals!.first!.strInstructions ?? '',
      ingredients:
          model.meals!.first?.strIngredient!.map((e) => e ?? '').toList() ?? [],
      measures:
          model.meals!.first?.strMeasure!.map((e) => e ?? '').toList() ?? [],
      youtube: model.meals!.first!.strYoutube ?? '',
      area: model.meals!.first!.strArea ?? '',
      category: model.meals!.first!.strCategory ?? '',
      id: model.meals!.first!.idMeal ?? '',
      tags: model.meals!.first!.strTags ?? '',
      alternateName: '',
    );
  }
}
