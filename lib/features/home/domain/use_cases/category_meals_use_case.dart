import 'package:fitness_app/features/home/domain/contracts/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/response/get_meals_categories_response_entity.dart';

@injectable
class CategoryMealsUseCase {
  final HomeRepo _homeRepo;

  CategoryMealsUseCase(this._homeRepo);

  Future<DataResult<GetMealsCategoriesResponseEntity>>
      getMealsCategories() async => await _homeRepo.getMealsCategories();
}
