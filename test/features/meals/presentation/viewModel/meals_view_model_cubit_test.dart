import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_details_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meals_category_entity.dart';
import 'package:fitness_app/features/meals/domain/use_cases/get_meal_by_id_case.dart';
import 'package:fitness_app/features/meals/domain/use_cases/get_meals_by_category_case.dart';
import 'package:fitness_app/features/meals/domain/use_cases/get_meals_categories_case.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_actions.dart';
import 'package:fitness_app/features/meals/presentation/viewModel/meals_view_model_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_meals_helper.dart';
import 'meals_view_model_cubit_test.mocks.dart';

@GenerateMocks(
    [GetMealsCategoriesCase, GetMealsByCategoryCase, GetMealByIdCase])
void main() {
  late MealsViewModelCubit viewModel;
  late MockGetMealsCategoriesCase mockGetMealsCategoriesCase;
  late MockGetMealsByCategoryCase mockGetMealsByCategoryCase;
  late MockGetMealByIdCase mockGetMealByIdCase;

  setUp(() {
    mockGetMealsCategoriesCase = MockGetMealsCategoriesCase();
    mockGetMealsByCategoryCase = MockGetMealsByCategoryCase();
    mockGetMealByIdCase = MockGetMealByIdCase();
    viewModel = MealsViewModelCubit(
      mockGetMealsCategoriesCase,
      mockGetMealsByCategoryCase,
      mockGetMealByIdCase,
    );
    provideDummy<DataResult<List<MealsCategoryEntity>>>(
        Success<List<MealsCategoryEntity>>(DummyMealsHelper.mealsCategoryList));
    provideDummy<DataResult<List<MealsCategoryEntity>>>(
        Fail<List<MealsCategoryEntity>>(Exception('error')));
    provideDummy<DataResult<List<MealEntity>>>(
        Success<List<MealEntity>>(DummyMealsHelper.mealsList));
    provideDummy<DataResult<List<MealEntity>>>(
        Fail<List<MealEntity>>(Exception('error')));
    provideDummy<DataResult<MealDetailsEntity>>(
        Success<MealDetailsEntity>(DummyMealsHelper.mealDetailsEntity));
    provideDummy<DataResult<MealDetailsEntity>>(
        Fail<MealDetailsEntity>(Exception('error')));
    when(mockGetMealsCategoriesCase()).thenAnswer((_) async =>
        await Success<List<MealsCategoryEntity>>(
            DummyMealsHelper.mealsCategoryList));
    when(mockGetMealsByCategoryCase(any)).thenAnswer((_) async =>
        await Success<List<MealEntity>>(DummyMealsHelper.mealsList));
  });
  group(
    'when call (getMealsCategories , getMealsByCategory , getMealById)',
    () {
      group(
        ' when call doAction function call get MealsCategories from useCase',
        () {
          blocTest<MealsViewModelCubit, MealsViewModelState>(
            ' when call doAction function it should call getMealsCategories from useCase and change state with the right sequence',
            build: () {
              when(mockGetMealsCategoriesCase()).thenAnswer((_) async =>
                  await Success<List<MealsCategoryEntity>>(
                      DummyMealsHelper.mealsCategoryList));
              return viewModel;
            },
            act: (cubit) {
              cubit.doAction(LoadMealsCategories());
            },
            expect: () => [
              isA<MealsCategoriesLoading>(),
              isA<MealsCategoriesSuccess>(),
            ],
            verify: (cubit) {
              verify(mockGetMealsCategoriesCase()).called(1);
            },
          );

          blocTest<MealsViewModelCubit, MealsViewModelState>(
            ' when call doAction function  returns fail  it should emit Error state',
            build: () {
              when(mockGetMealsCategoriesCase()).thenAnswer((_) async =>
                  await Fail<List<MealsCategoryEntity>>(Exception('Error')));
              return viewModel;
            },
            act: (cubit) {
              cubit.doAction(LoadMealsCategories());
            },
            expect: () => [
              isA<MealsCategoriesLoading>(),
              isA<MealsCategoriesError>(),
            ],
            verify: (cubit) {
              verify(mockGetMealsCategoriesCase()).called(1);
            },
          );
        },
      );

      group(
        ' when call doAction function call get MealsByCategory from useCase',
        () {
          blocTest<MealsViewModelCubit, MealsViewModelState>(
            ' when call doAction function it should call getMealsByCategory from useCase and change state with the right sequence',
            build: () {
              when(mockGetMealsByCategoryCase(any)).thenAnswer((_) async =>
                  await Success<List<MealEntity>>(DummyMealsHelper.mealsList));
              return viewModel;
            },
            act: (cubit) {
              cubit.doAction(FilterMealsByCategory('1'));
            },
            expect: () => [
              isA<MealsByCategoryLoading>(),
              isA<MealsByCategorySuccess>(),
            ],
            verify: (cubit) {
              verify(mockGetMealsByCategoryCase(any)).called(1);
            },
          );

          blocTest<MealsViewModelCubit, MealsViewModelState>(
            ' when call doAction function  returns fail  it should emit Error state',
            build: () {
              when(mockGetMealsByCategoryCase(any)).thenAnswer((_) async =>
                  await Fail<List<MealEntity>>(Exception('Error')));
              return viewModel;
            },
            act: (cubit) {
              cubit.doAction(FilterMealsByCategory('1'));
            },
            expect: () => [
              isA<MealsByCategoryLoading>(),
              isA<MealsByCategoryError>(),
            ],
            verify: (cubit) {
              verify(mockGetMealsByCategoryCase(any)).called(1);
            },
          );
        },
      );
      group( ' when call doAction function call get MealById from useCase', () {
        blocTest<MealsViewModelCubit, MealsViewModelState>(
          ' when call doAction function it should call getMealById from useCase and change state with the right sequence',
          build: () {
            when(mockGetMealByIdCase(any)).thenAnswer((_) async =>
                await Success<MealDetailsEntity>(
                    DummyMealsHelper.mealDetailsEntity));
            return viewModel;
          },
          act: (cubit) {
            cubit.doAction(GetMealInfo('1'));
          },
          expect: () => [
            isA<MealInfoLoading>(),
            isA<RandomMealsLoading>(), // If this is expected, include it
            isA<MealInfoSuccess>(),
            isA<RandomMealsSuccess>(),
          ],
          verify: (cubit) {
            verify(mockGetMealByIdCase(any)).called(1);
          },
        );
      });
      blocTest<MealsViewModelCubit, MealsViewModelState>(
        ' when call doAction function  returns fail  it should emit Error state',
        build: () {
          when(mockGetMealByIdCase(any)).thenAnswer(
              (_) async => await Fail<MealDetailsEntity>(Exception('Error')));
          return viewModel;
        },
        act: (cubit) {
          cubit.doAction(GetMealInfo('1'));
        },
        expect: () => [
          isA<MealInfoLoading>(),
          isA<MealInfoError>(),
        ],
        verify: (cubit) {
          verify(mockGetMealByIdCase(any)).called(1);
        },
      );

    },
  );
}
