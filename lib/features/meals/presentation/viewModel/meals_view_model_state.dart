part of 'meals_view_model_cubit.dart';

sealed class MealsViewModelState extends Equatable {
  const MealsViewModelState();
}

final class MealsViewModelInitial extends MealsViewModelState {

  @override
  List<Object> get props => [];
}

/// Meals Categories

final class MealsCategoriesLoading extends MealsViewModelState {
  @override
  List<Object?> get props => [];
}

final class MealsCategoriesSuccess extends MealsViewModelState {
  final List<MealsCategoryEntity> categories;
  const MealsCategoriesSuccess(this.categories);
  @override
  List<Object?> get props => [categories];
}

final class MealsCategoriesError extends MealsViewModelState {
  final ErrorModel errorModel;
  const MealsCategoriesError(this.errorModel);
  @override
  List<Object?> get props => [errorModel];
}

/// Meals By Category

final class MealsByCategoryLoading extends MealsViewModelState {
  @override
  List<Object?> get props => [];
}

final class MealsByCategorySuccess extends MealsViewModelState {
  final List<MealEntity> meals;
  const MealsByCategorySuccess(this.meals);
  @override
  List<Object?> get props => [meals];
}

final class MealsByCategoryError extends MealsViewModelState {
  final ErrorModel errorModel;
  const MealsByCategoryError(this.errorModel);
  @override
  List<Object?> get props => [errorModel];
}

/// Meal Info

final class MealInfoLoading extends MealsViewModelState {
  @override
  List<Object?> get props => [];
}

final class MealInfoSuccess extends MealsViewModelState {
  final MealDetailsEntity mealDetailsEntity;
  const MealInfoSuccess(this.mealDetailsEntity);
  @override
  List<Object?> get props => [mealDetailsEntity];
}

final class MealInfoError extends MealsViewModelState {
  final ErrorModel errorModel;
  const MealInfoError(this.errorModel);
  @override
  List<Object?> get props => [errorModel];
}
