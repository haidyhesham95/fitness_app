import 'package:fitness_app/core/networking/api/meals_api_manager/meals_api_manager.dart';
import 'package:fitness_app/core/networking/api_execute.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/meals/data/data_sources/contracts/meals_data_source.dart';
import 'package:fitness_app/features/meals/data/mapper/meals_dto_mapper.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_details_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meals_category_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MealsDataSource)
class MealsDataSourceImpl implements MealsDataSource {
  final MealsApiManager _mealsApiManager;

  MealsDataSourceImpl(this._mealsApiManager);

  @override
  Future<DataResult<MealDetailsEntity>> getMealById(String id) async {
    final result = await _mealsApiManager.getMealById(id);

    return await executeApi(
        () async => await MealsDtoMapper.toMealDetailsEntity(result));
  }

  @override
  Future<DataResult<List<MealEntity>>> getMealsByCategory(
      String category) async {
    final result = await _mealsApiManager.getMealsByCategory(category);
    return await executeApi(
      () async => await MealsDtoMapper.toMealsEntity(result),
    );
  }

  @override
  Future<DataResult<List<MealsCategoryEntity>>> getMealsCategories() async {
    final result = await _mealsApiManager.getMealsCategories();
    return executeApi(
        () async => await MealsDtoMapper.toMealsCategoryEntity(result));
  }
}
