import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/meals/data/data_sources/contracts/meals_data_source.dart';
import 'package:fitness_app/features/meals/data/repositories/meals_repository_impl.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_details_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meals_category_entity.dart';
import 'package:fitness_app/features/meals/domain/repositories/meals_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_meals_helper.dart';
import 'meals_repository_test.mocks.dart';

@GenerateMocks([MealsDataSource])
void main() {
  late MockMealsDataSource mockMealsDataSource;
  late MealsRepository mealsRepository;
  group(
      'when call (getMealsCategoriesRepository , getMealsByCategoryRepository , getMealByIdRepository)',
      () {
        setUp(
              () {
            mockMealsDataSource = MockMealsDataSource();
            mealsRepository = MealsRepositoryImpl(mockMealsDataSource);
            provideDummy<DataResult<List<MealsCategoryEntity>>>(
                Success<List<MealsCategoryEntity>>(
                    DummyMealsHelper.mealsCategoryList));
            provideDummy<DataResult<List<MealEntity>>>(
                Success<List<MealEntity>>(DummyMealsHelper.mealsList));
            provideDummy<DataResult<MealDetailsEntity>>(
                Success<MealDetailsEntity>(DummyMealsHelper.mealDetailsEntity));
          },
        );

        test('getMealsByCategoryRepository', () async {
          when(mockMealsDataSource.getMealsByCategory(any)).thenAnswer((_) async =>
          await Success<List<MealEntity>>(DummyMealsHelper.mealsList));
          final result = await mealsRepository.getMealsByCategory('1');
          expect(result, isA<DataResult<List<MealEntity>>>());
          verify(mockMealsDataSource.getMealsByCategory(any)).called(1);
        });

        test('getMealsCategoriesRepository', () async {
          when(mockMealsDataSource.getMealsCategories()).thenAnswer((_) async =>
          await Success<List<MealsCategoryEntity>>(
              DummyMealsHelper.mealsCategoryList));
          final result = await mealsRepository.getMealsCategories();
          expect(result, isA<DataResult<List<MealsCategoryEntity>>>());
          verify(mockMealsDataSource.getMealsCategories()).called(1);
        });

          test('getMealByIdRepository', () async {
            when(mockMealsDataSource.getMealById(any)).thenAnswer((_) async =>
                 Success<MealDetailsEntity>(DummyMealsHelper.mealDetailsEntity));
            final result = await mealsRepository.getMealById('1');
            expect(result, isA<Success<MealDetailsEntity>>());
            verify(mockMealsDataSource.getMealById(any)).called(1);
        });
      });}
