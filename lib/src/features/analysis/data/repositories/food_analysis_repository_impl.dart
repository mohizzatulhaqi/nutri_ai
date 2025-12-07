import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/core/infra/infra.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/data/datasources/gemini_api_datasource.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/entities/food_analysis.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/repositories/food_analysis_repository.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/domain/entities/food_recommendation_entity.dart';

@LazySingleton(as: FoodAnalysisRepository)
class FoodAnalysisRepositoryImpl implements FoodAnalysisRepository {
  final GeminiApiDataSource _dataSource;

  FoodAnalysisRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, FoodAnalysis>> analyzeImage(
    Uint8List imageBytes,
    String languageCode,
  ) async {
    try {
      debugPrint('Repository: Starting image analysis...');
      final result = await _dataSource.analyzeImage(imageBytes, languageCode);
      debugPrint('Repository: Analysis completed successfully');
      return Either.right(result.toEntity());
    } catch (e) {
      debugPrint('Repository: Error occurred: $e');

      String errorMessage;
      if (e.toString().contains('API key')) {
        errorMessage =
            'Invalid or missing API key. Please check your Gemini API configuration.';
      } else if (e.toString().contains('network') ||
          e.toString().contains('connection')) {
        errorMessage =
            'Network error. Please check your internet connection and try again.';
      } else if (e.toString().contains('parse') ||
          e.toString().contains('JSON')) {
        errorMessage =
            'Failed to process the analysis result. The AI response was in an unexpected format.';
      } else if (e.toString().contains('quota') ||
          e.toString().contains('limit')) {
        errorMessage = 'API quota exceeded. Please try again later.';
      } else {
        errorMessage = 'Analysis failed: ${e.toString()}';
      }

      return Either.left(ServerFailure(errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<FoodRecommendationEntity>>>
  getFoodRecommendations(String preference) async {
    try {
      debugPrint('Repository: Starting food recommendations...');
      final result = await _dataSource.getFoodRecommendations(preference);
      debugPrint('Repository: Recommendations completed successfully');
      return Either.right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      debugPrint('Repository: Error occurred: $e');
      return Either.left(ServerFailure('Failed to get recommendations: $e'));
    }
  }
}
