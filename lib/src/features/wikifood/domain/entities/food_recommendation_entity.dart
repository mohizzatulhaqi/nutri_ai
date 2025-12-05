import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/entities/food_analysis.dart';

part 'food_recommendation_entity.freezed.dart';

@freezed
class FoodRecommendationEntity with _$FoodRecommendationEntity {
  const factory FoodRecommendationEntity({required FoodAnalysis analysis}) =
      _FoodRecommendationEntity;
}
