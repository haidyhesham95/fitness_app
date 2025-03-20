import 'package:fitness_app/features/meals/data/models/meals_by_category_response_dto.dart';
import 'package:fitness_app/features/meals/data/models/meals_categories_response_dto.dart';
import 'package:fitness_app/features/meals/data/models/meals_details_response_dto.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_details_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/meals/domain/entities/meals_category_entity.dart';

class DummyMealsHelper {
  static MealsCategoryEntity mealsCategoryEntity = MealsCategoryEntity(
    categoryName: 'Beef',
    categoryImage: 'https://www.themealdb.com/images/category/beef.png',
  );
  static List<MealsCategoryEntity> mealsCategoryList = List.generate(
    3,
    (index) => mealsCategoryEntity,
  );

  static MealEntity mealEntity = MealEntity(
    mealId: '1',
    mealName: 'Beef',
    mealImageUrl: 'https://www.themealdb.com/images/category/beef.png',
  );

  static List<MealEntity> mealsList = List.generate(
    1,
    (index) => mealEntity,
  );
  static String instructions = '''
First make the Hollandaise sauce. Put the lemon juice and vinegar in a small bowl, add the egg yolks and whisk with a balloon whisk until light and frothy.
Place the bowl over a pan of simmering water and whisk until mixture thickens.
Gradually add the butter, whisking constantly until thick – if it looks like it might be splitting, then whisk off the heat for a few mins.
Season and keep warm.
To poach the eggs, bring a large pan of water to the boil and add the vinegar.
Lower the heat so that the water is simmering gently.
Stir the water so you have a slight whirlpool, then slide in the eggs one by one.
Cook each for about 4 mins, then remove with a slotted spoon.
Lightly toast and butter the muffins, then put a couple of slices of salmon on each half.
Top each with an egg, spoon over some Hollandaise and garnish with chopped chives.
''';
  static String image =
      'https://www.themealdb.com/images/media/meals/1550440197.jpg';

  static String tags = 'Bun,Brunch';
  static String youtube = 'https://www.youtube.com/watch?v=Woiiet4vQ58';
  static List<String> ingredients = [
    'Eggs',
    'White Wine Vinegar',
    'English Muffins',
    'Butter',
    'Smoked Salmon',
    'Lemon Juice',
    'White Wine Vinegar',
    'Egg',
    'Unsalted Butter',
  ];
  static List<String> measures = [
    '4',
    '2 tbs',
    '2',
    'To serve',
    '8 slices',
    '2 tsp',
    '2 tsp',
    '3 Yolkes',
    '125g',
  ];

  static MealDetailsEntity mealDetailsEntity = MealDetailsEntity(
    image: image,
    name: 'Salmon Eggs Eggs Benedict',
    category: 'Breakfast',
    area: 'American',
    instructions: instructions,
    ingredients: ingredients,
    measures: measures,
    youtube: youtube,
    tags: tags,
    id: '1',
  );
  static MealsByCategoryResponseDto mealsByCategoryResponseDto =
      MealsByCategoryResponseDto(
    [
      MealsByCategoryDto(
          'Beef', 'https://www.themealdb.com/images/category/beef.png', '1'),
      MealsByCategoryDto(
          'Beef', 'https://www.themealdb.com/images/category/beef.png', '1'),
      MealsByCategoryDto(
          'Beef', 'https://www.themealdb.com/images/category/beef.png', '1'),
    ],
  );

  static MealsDetailsResponseDto mealsDetailsResponseDto =
      MealsDetailsResponseDto(
    meals: [
      MealsDetailsDto(
        idMeal: '1',
        strMeal: 'Beef',
        strMealThumb: 'https://www.themealdb.com/images/category/beef.png',
        strInstructions: instructions,
        strTags: tags,
        strYoutube: youtube,
        strArea: 'American',
        strCategory: 'Breakfast',
        dateModified: '2022-06-09 00:00:00',
        strCreativeCommonsConfirmed: 'No',
        strImageSource: 'https://www.themealdb.com/images/category/beef.png',
        strSource: 'https://www.themealdb.com/images/category/beef.png',
        strIngredient: ingredients,
        strMeasure: measures,
        strMealAlternate: '',
      ),
    ],
  );

  static MealsDetailsResponseDto mealsDetailsResponseDtoEmpty =
      MealsDetailsResponseDto(meals: [
    MealsDetailsDto(
      idMeal: '1',
      strMeal: 'Breakfast Eggs and Smoked Salmon on Toasted Bagels',
      strMealThumb: image,
      strInstructions: instructions,
      strTags: tags,
      strYoutube: youtube,
      strArea: 'American',
      strCategory: 'Breakfast',
      dateModified: '2022-06-09 00:00:00',
      strCreativeCommonsConfirmed: '',
      strImageSource: image,
      strSource: 'https://www.themealdb.com/meal.php?r=52977',
      strIngredient: ingredients,
      strMeasure: measures,
      strMealAlternate: '',
    ),
  ]);
  static MealsCategoriesResponseDto mealsCategoriesResponseDto =
      MealsCategoriesResponseDto(
    [
      MealsCategoriesDto('1', 'Beef',
          'https://www.themealdb.com/images/category/beef.png', '1'),
    ],
  );
}
