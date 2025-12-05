import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/data/models/food_analysis_model.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/domain/entities/food_recommendation_entity.dart';

part 'food_recommendation_model.freezed.dart';
part 'food_recommendation_model.g.dart';

@freezed
class FoodRecommendationModel with _$FoodRecommendationModel {
  const FoodRecommendationModel._();

  const factory FoodRecommendationModel({required FoodAnalysisModel analysis}) =
      _FoodRecommendationModel;

  factory FoodRecommendationModel.fromJson(Map<String, dynamic> json) =>
      _$FoodRecommendationModelFromJson(json);

  FoodRecommendationEntity toEntity() =>
      FoodRecommendationEntity(analysis: analysis.toEntity());
}
