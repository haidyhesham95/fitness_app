// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_categories_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsCategoriesResponseDto _$MealsCategoriesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    MealsCategoriesResponseDto(
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MealsCategoriesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


MealsCategoriesDto _$MealsCategoriesDtoFromJson(Map<String, dynamic> json) =>
    MealsCategoriesDto(
      json['idCategory'] as String?,
      json['strCategory'] as String?,
      json['strCategoryThumb'] as String?,
      json['strCategoryDescription'] as String?,
    );

