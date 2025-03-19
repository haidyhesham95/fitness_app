import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/meals/domain/entities/meals_category_entity.dart';
import 'package:fitness_app/features/meals/domain/repositories/meals_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetMealsCategoriesCase {
  final MealsRepository repository;

  GetMealsCategoriesCase(this.repository);

  Future<DataResult<List<MealsCategoryEntity>>> call() {
    return repository.getMealsCategories();
  }
}
