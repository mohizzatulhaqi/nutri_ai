import 'dart:typed_data';

import 'package:nutri_ai_devfest2025/src/core/infra/infra.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/entities/food_analysis.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/domain/entities/food_recommendation_entity.dart';

abstract class FoodAnalysisRepository {
  Future<Either<Failure, FoodAnalysis>> analyzeImage(
    Uint8List imageBytes,
    String languageCode,
  );
  Future<Either<Failure, List<FoodRecommendationEntity>>>
  getFoodRecommendations(String preference);
}
