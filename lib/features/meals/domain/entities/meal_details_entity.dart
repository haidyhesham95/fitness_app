class MealDetailsEntity {
  final String id;
  final String name;
  final String? alternateName;
  final String category;
  final String area;
  final String instructions;
  final String image;
  final String tags;
  final String youtube;
  final List<String> ingredients;
  final List<String> measures;

  const MealDetailsEntity({
    required this.id,
    required this.name,
    this.alternateName,
    required this.category,
    required this.area,
    required this.instructions,
    required this.image,
    required this.tags,
    required this.youtube,
    required this.ingredients,
    required this.measures,
  });
}
