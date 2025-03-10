import 'package:json_annotation/json_annotation.dart';

part 'meals_by_category_response_dto.g.dart';

@JsonSerializable()
class MealsByCategoryResponseDto {
  final List<MealsByCategoryDto?>? meals;

  MealsByCategoryResponseDto(this.meals);

  factory MealsByCategoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MealsByCategoryResponseDtoFromJson(json);

}

@JsonSerializable()
class MealsByCategoryDto {
  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;

  MealsByCategoryDto(this.strMeal, this.strMealThumb, this.idMeal);

  factory MealsByCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$MealsByCategoryDtoFromJson(json);


}
