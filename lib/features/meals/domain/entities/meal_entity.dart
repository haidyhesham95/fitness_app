import 'package:equatable/equatable.dart';

class MealEntity extends  Equatable {
  final String mealId;
  final String mealName;
  final String mealImageUrl;

  MealEntity(
      {required this.mealId,
      required this.mealName,
      required this.mealImageUrl});

  @override
  List<Object?> get props => [mealId, mealName, mealImageUrl];
}
