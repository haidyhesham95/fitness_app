import "package:fitness_app/core/networking/common/api_result.dart";
import "package:fitness_app/features/meals/data/data_sources/contracts/meals_data_source.dart";
import "package:fitness_app/features/meals/domain/entities/meal_details_entity.dart";
import "package:fitness_app/features/meals/domain/entities/meal_entity.dart";
import "package:fitness_app/features/meals/domain/entities/meals_category_entity.dart";
import "package:injectable/injectable.dart";

import "../../domain/repositories/meals_repository.dart";

@Injectable(as: MealsRepository)
class MealsRepositoryImpl implements MealsRepository {
  MealsDataSource mealsDataSource;

  MealsRepositoryImpl(this.mealsDataSource);

  @override
  Future<DataResult<MealDetailsEntity>> getMealById(String id) {
    return mealsDataSource.getMealById(id);
  }

  @override
  Future<DataResult<List<MealEntity>>> getMealsByCategory(String category) {
    return mealsDataSource.getMealsByCategory(category);
  }

  @override
  Future<DataResult<List<MealsCategoryEntity>>> getMealsCategories() {
    return mealsDataSource.getMealsCategories();
  }
}
