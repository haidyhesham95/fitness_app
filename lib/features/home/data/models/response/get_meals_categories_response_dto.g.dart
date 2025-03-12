// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_meals_categories_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMealsCategoriesResponseDto _$GetMealsCategoriesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetMealsCategoriesResponseDto(
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetMealsCategoriesResponseDtoCategories.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMealsCategoriesResponseDtoToJson(
        GetMealsCategoriesResponseDto instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

GetMealsCategoriesResponseDtoCategories
    _$GetMealsCategoriesResponseDtoCategoriesFromJson(
            Map<String, dynamic> json) =>
        GetMealsCategoriesResponseDtoCategories(
          json['idCategory'] as String?,
          json['strCategory'] as String?,
          json['strCategoryThumb'] as String?,
          json['strCategoryDescription'] as String?,
        );

Map<String, dynamic> _$GetMealsCategoriesResponseDtoCategoriesToJson(
        GetMealsCategoriesResponseDtoCategories instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };
