import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/entities/food_analysis.dart';

part 'food_analysis_model.freezed.dart';
part 'food_analysis_model.g.dart';

@freezed
class FoodAnalysisModel with _$FoodAnalysisModel {
  const FoodAnalysisModel._();

  const factory FoodAnalysisModel({
    required String foodName,
    required String description,
    required double calories,
    required double protein,
    required double fat,
    required double carbohydrates,
    required List<String> micronutrients,
    required List<String> ingredients,
    List<String>? recommendationReason,
  }) = _FoodAnalysisModel;

  factory FoodAnalysisModel.fromJson(Map<String, dynamic> json) =>
      _$FoodAnalysisModelFromJson(json);

  FoodAnalysis toEntity() {
    return FoodAnalysis(
      foodName: foodName,
      description: description,
      calories: calories,
      protein: protein,
      fat: fat,
      carbohydrates: carbohydrates,
      micronutrients: micronutrients,
      ingredients: ingredients,
      recommendationReason: recommendationReason,
    );
  }
}
