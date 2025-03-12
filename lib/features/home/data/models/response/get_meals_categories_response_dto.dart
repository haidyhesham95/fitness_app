import 'package:json_annotation/json_annotation.dart';

part 'get_meals_categories_response_dto.g.dart';

@JsonSerializable()
class GetMealsCategoriesResponseDto {
  final List<GetMealsCategoriesResponseDtoCategories?>? categories;

  GetMealsCategoriesResponseDto(this.categories);

  factory GetMealsCategoriesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetMealsCategoriesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetMealsCategoriesResponseDtoToJson(this);
}

@JsonSerializable()
class GetMealsCategoriesResponseDtoCategories {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  GetMealsCategoriesResponseDtoCategories(this.idCategory, this.strCategory,
      this.strCategoryThumb, this.strCategoryDescription);

  factory GetMealsCategoriesResponseDtoCategories.fromJson(
          Map<String, dynamic> json) =>
      _$GetMealsCategoriesResponseDtoCategoriesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetMealsCategoriesResponseDtoCategoriesToJson(this);
}
