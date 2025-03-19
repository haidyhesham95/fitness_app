import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/meals/domain/repositories/meals_repository.dart';
import 'package:fitness_app/features/meals/domain/use_cases/get_meals_by_category_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_meals_helper.dart';
import 'get_meals_categories_case_test.mocks.dart';

@GenerateMocks([MealsRepository])
void main() {
  late MockMealsRepository mockMealsRepository;
  late GetMealsByCategoryCase getMealsCategories;
  setUp(
    () {
      mockMealsRepository = MockMealsRepository();
      getMealsCategories = GetMealsByCategoryCase(mockMealsRepository);
      provideDummy<DataResult<List<MealEntity>>>(
          Success<List<MealEntity>>(DummyMealsHelper.mealsList));
    },
  );
  test('when getMealsCategoriesCase is called', () async {
    when(mockMealsRepository.getMealsByCategory(any)).thenAnswer((_) async =>
        await Success<List<MealEntity>>(DummyMealsHelper.mealsList));
    final result = await getMealsCategories('1');
    expect(result, isA<DataResult<List<MealEntity>>>());
    verify(mockMealsRepository.getMealsByCategory(any)).called(1);
  });
}