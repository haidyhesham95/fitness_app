import 'package:equatable/equatable.dart';

class MealsCategoryEntity extends Equatable {
  final String categoryName;
  final String categoryImage;

  MealsCategoryEntity({
    required this.categoryName,
    required this.categoryImage,
  });

  @override
  List<Object?> get props => [categoryName, categoryImage];
}
