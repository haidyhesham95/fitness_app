import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/meals/domain/entities/meals_category_entity.dart';
import 'package:fitness_app/features/meals/domain/repositories/meals_repository.dart';
import 'package:fitness_app/features/meals/domain/use_cases/get_meals_categories_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_meals_helper.dart';
import 'get_meals_categories_case_test.mocks.dart';

@GenerateMocks([MealsRepository])
void main() {
  late MockMealsRepository mockMealsRepository;
  late GetMealsCategoriesCase getMealsCategories;
  setUp(
    () {
      mockMealsRepository = MockMealsRepository();
      getMealsCategories = GetMealsCategoriesCase(mockMealsRepository);
      provideDummy<DataResult<List<MealsCategoryEntity>>>(
          Success<List<MealsCategoryEntity>>(
              DummyMealsHelper.mealsCategoryList));
    },
  );
  test('when getMealsCategoriesCase is called', () async {
    when(mockMealsRepository.getMealsCategories()).thenAnswer((_) async =>
        await Success<List<MealsCategoryEntity>>(
            DummyMealsHelper.mealsCategoryList));
    final result = await getMealsCategories();
    expect(result, isA<DataResult<List<MealsCategoryEntity>>>());
    verify(mockMealsRepository.getMealsCategories()).called(1);
  });
}
