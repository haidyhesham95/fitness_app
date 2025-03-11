import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class MealsDetailsResponseDto {
  final List<MealsDetailsDto?>? meals;

  MealsDetailsResponseDto({this.meals});

  factory MealsDetailsResponseDto.fromJson(Map<String, dynamic> json) {
    return MealsDetailsResponseDto(
      meals: json['meals'] != null
          ? (json['meals'] as List).map((i) => MealsDetailsDto.fromJson(i)).toList()
          : [],
    );
  }



}

@JsonSerializable()
class MealsDetailsDto {
  final String? idMeal;
  final String? strMeal;
  final String? strMealAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<String?>? strIngredient;

  final List<String?>? strMeasure;

  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;

  MealsDetailsDto(
      {this.idMeal,
      this.strMeal,
      this.strMealAlternate,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb,
      this.strTags,
      this.strYoutube,
      this.strSource,
      this.strImageSource,
      this.strCreativeCommonsConfirmed,
      this.dateModified,
      this.strIngredient,
      this.strMeasure});

  factory MealsDetailsDto.fromJson(Map<String, dynamic> json) {

    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      final String ingredient = json['strIngredient$i'];
      final  String measure = json['strMeasure$i'];
      if (ingredient.isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure );
      }
    }

    return MealsDetailsDto(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealAlternate: json['strMealAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'] ?? '',
      strYoutube: json['strYoutube'],
      strIngredient: ingredients,
      strMeasure: measures,
      dateModified: json['dateModified'],
      strSource: json['strSource'],
      strImageSource: json['strImageSource'],
      strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
    );

  }
}
