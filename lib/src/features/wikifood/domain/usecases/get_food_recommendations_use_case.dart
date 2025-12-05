import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/core/infra/infra.dart';
import 'package:nutri_ai_devfest2025/src/core/usecase/usecases.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/repositories/food_analysis_repository.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/domain/entities/food_recommendation_entity.dart';

@lazySingleton
class GetFoodRecommendationsUseCase
    implements UseCase<List<FoodRecommendationEntity>, String> {
  final FoodAnalysisRepository _repository;

  GetFoodRecommendationsUseCase(this._repository);

  @override
  Future<Either<Failure, List<FoodRecommendationEntity>>> call(String params) {
    return _repository.getFoodRecommendations(params);
  }
}
