import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_details_entity.dart';
import 'package:fitness_app/features/meals/domain/repositories/meals_repository.dart';
import 'package:fitness_app/features/meals/domain/use_cases/get_meal_by_id_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_meals_helper.dart';
import 'get_meals_by_category_case_test.mocks.dart';

@GenerateMocks([MealsRepository])
void main() {
  late MockMealsRepository mockMealsRepository;
  late GetMealByIdCase getMealByIdCase;
  setUp(
    () {
      mockMealsRepository = MockMealsRepository();
      getMealByIdCase = GetMealByIdCase(mockMealsRepository);
      provideDummy<DataResult<MealDetailsEntity>>(
          Success<MealDetailsEntity>(DummyMealsHelper.mealDetailsEntity));
    },
  );
  test('when getMealsCategoriesCase is called', () async {
    when(mockMealsRepository.getMealById(any)).thenAnswer((_) async =>
        await Success<MealDetailsEntity>(DummyMealsHelper.mealDetailsEntity));
    final result = await getMealByIdCase('1');
    expect(result, isA<DataResult<MealDetailsEntity>>());
    verify(mockMealsRepository.getMealById(any)).called(1);
  });
}
