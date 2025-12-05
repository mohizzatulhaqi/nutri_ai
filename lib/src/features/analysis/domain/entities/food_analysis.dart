import 'package:equatable/equatable.dart';

class FoodAnalysis extends Equatable {
  final String foodName;
  final String description;
  final double calories;
  final double protein;
  final double fat;
  final double carbohydrates;
  final List<String> micronutrients;
  final List<String> ingredients;
  final List<String>? recommendationReason;

  const FoodAnalysis({
    required this.foodName,
    required this.description,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
    required this.micronutrients,
    required this.ingredients,
    this.recommendationReason,
  });

  FoodAnalysis copyWith({
    String? foodName,
    String? description,
    double? calories,
    double? protein,
    double? fat,
    double? carbohydrates,
    List<String>? micronutrients,
    List<String>? ingredients,
    List<String>? recommendationReason,
  }) {
    return FoodAnalysis(
      foodName: foodName ?? this.foodName,
      description: description ?? this.description,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      micronutrients: micronutrients ?? this.micronutrients,
      ingredients: ingredients ?? this.ingredients,
      recommendationReason: recommendationReason ?? this.recommendationReason,
    );
  }

  @override
  List<Object?> get props => [
    foodName,
    description,
    calories,
    protein,
    fat,
    carbohydrates,
    micronutrients,
    ingredients,
    recommendationReason,
  ];
}
