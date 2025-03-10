sealed class MealsActions {}

class LoadMealsCategories extends MealsActions {}

class FilterMealsByCategory extends MealsActions {
  final String category;
  FilterMealsByCategory(this.category);
}

class GetMealInfo extends MealsActions {
  final String id;
  GetMealInfo(this.id);
}
