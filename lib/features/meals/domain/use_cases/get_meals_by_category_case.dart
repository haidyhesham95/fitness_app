import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/meals/domain/repositories/meals_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMealsByCategoryCase {
  final MealsRepository repository;

  GetMealsByCategoryCase(this.repository);

  Future<DataResult<List<MealEntity>>> call(String category) {
    return repository.getMealsByCategory(category);
  }
}
