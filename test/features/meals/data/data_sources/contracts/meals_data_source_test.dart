import 'package:fitness_app/core/networking/api/meals_api_manager/meals_api_manager.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/meals/data/data_sources/contracts/meals_data_source.dart';
import 'package:fitness_app/features/meals/data/data_sources/impl/meals_data_source_impl.dart';
import 'package:fitness_app/features/meals/data/mapper/meals_dto_mapper.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_details_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meals_category_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_meals_helper.dart';
import 'meals_data_source_test.mocks.dart';

@GenerateMocks([MealsApiManager])
void main() {
  late MockMealsApiManager mockApiManager;
  late MealsDataSource dataSource;

  setUp(
    () {
      mockApiManager = MockMealsApiManager();
    },
  );
  group(
    ' when call (getMealsCategories , getMealsByCategory , getMealById)',
    () {
      test(
        'when call (getMealsCategories)',
        () async {
          List<MealsCategoryEntity> expected =
              MealsDtoMapper.toMealsCategoryEntity(
                  DummyMealsHelper.mealsCategoriesResponseDto);
          dataSource = MealsDataSourceImpl(mockApiManager);
          var mockedResult = Success<List<MealsCategoryEntity>>(expected);
          provideDummy<DataResult<List<MealsCategoryEntity>>>(mockedResult);
          when(mockApiManager.getMealsCategories()).thenAnswer(
              (_) async => await DummyMealsHelper.mealsCategoriesResponseDto);

          var result = await dataSource.getMealsCategories();

          expect(result, isA<Success<List<MealsCategoryEntity>>>());
          verify(mockApiManager.getMealsCategories()).called(1);
        },
      );
      test(
        'when call (getMealsByCategory)',
        () async {
          List<MealEntity> expected = MealsDtoMapper.toMealsEntity(
              DummyMealsHelper.mealsByCategoryResponseDto);

          dataSource = MealsDataSourceImpl(mockApiManager);
          var mockedResult = Success<List<MealEntity>>(expected);
          provideDummy<DataResult<List<MealEntity>>>(mockedResult);
          when(mockApiManager.getMealsByCategory('1')).thenAnswer(
              (_) async => await DummyMealsHelper.mealsByCategoryResponseDto);
          var result = await dataSource.getMealsByCategory('1');
          expect(result, isA<Success<List<MealEntity>>>());
          verify(mockApiManager.getMealsByCategory('1')).called(1);
        },
      );
      test(
        'when call (getMealById)',
        () async {
          MealDetailsEntity expected = MealsDtoMapper.toMealDetailsEntity(
              DummyMealsHelper.mealsDetailsResponseDto);
          dataSource = MealsDataSourceImpl(mockApiManager);
          var mockedResult = Success<MealDetailsEntity>(expected);
          provideDummy<DataResult<MealDetailsEntity>>(mockedResult);
          when(mockApiManager.getMealById('1')).thenAnswer(
              (_) async => await DummyMealsHelper.mealsDetailsResponseDto);
          var result = await dataSource.getMealById('1');
          expect(result, isA<Success<MealDetailsEntity>>());
          verify(mockApiManager.getMealById('1')).called(1);
        },
      );
    },
  );
}
