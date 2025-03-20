// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_by_category_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsByCategoryResponseDto _$MealsByCategoryResponseDtoFromJson(
        Map<String, dynamic> json) =>
    MealsByCategoryResponseDto(
      (json['meals'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MealsByCategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );



MealsByCategoryDto _$MealsByCategoryDtoFromJson(Map<String, dynamic> json) =>
    MealsByCategoryDto(
      json['strMeal'] as String?,
      json['strMealThumb'] as String?,
      json['idMeal'] as String?,
    );

