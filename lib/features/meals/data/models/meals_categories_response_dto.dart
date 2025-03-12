import 'package:json_annotation/json_annotation.dart';

part 'meals_categories_response_dto.g.dart';

@JsonSerializable()
class MealsCategoriesResponseDto {
  final List<MealsCategoriesDto?>? categories;

  MealsCategoriesResponseDto(this.categories);

  factory MealsCategoriesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MealsCategoriesResponseDtoFromJson(json);

}

@JsonSerializable()
class MealsCategoriesDto {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  MealsCategoriesDto(this.idCategory, this.strCategory,
      this.strCategoryThumb, this.strCategoryDescription);

  factory MealsCategoriesDto.fromJson(
          Map<String, dynamic> json) =>
      _$MealsCategoriesDtoFromJson(json);


}
