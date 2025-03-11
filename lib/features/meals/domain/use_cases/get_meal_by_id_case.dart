import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_details_entity.dart';
import 'package:fitness_app/features/meals/domain/repositories/meals_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetMealByIdCase {
  final MealsRepository repository;
  GetMealByIdCase(this.repository);

  Future<DataResult<MealDetailsEntity>> call(String id) {
    return repository.getMealById(id);
  }
}
