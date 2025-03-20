class GetMealsCategoriesResponseEntity {
  final List<GetMealsCategoriesResponseEntityCategories?>? categories;

  GetMealsCategoriesResponseEntity(this.categories);
}

class GetMealsCategoriesResponseEntityCategories {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  GetMealsCategoriesResponseEntityCategories(this.idCategory, this.strCategory,
      this.strCategoryThumb, this.strCategoryDescription);
}
