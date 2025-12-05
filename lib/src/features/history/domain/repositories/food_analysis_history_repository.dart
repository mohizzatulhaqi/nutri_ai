import 'package:nutri_ai_devfest2025/src/core/infra/infra.dart';
import 'package:nutri_ai_devfest2025/src/features/history/domain/domain.dart';

abstract class FoodAnalysisHistoryRepository {
  Future<Either<Failure, List<FoodAnalysisHistory>>> getFoodAnalysisHistory();
  Future<Either<Failure, void>> saveFoodAnalysis(
    FoodAnalysisHistory foodAnalysisHistory,
  );
}
