import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/core/infra/infra.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/data/models/food_analysis_model.dart';
import 'package:nutri_ai_devfest2025/src/features/history/data/datasources/local_storage_datasource.dart';
import 'package:nutri_ai_devfest2025/src/features/history/data/models/food_analysis_history_model.dart';
import 'package:nutri_ai_devfest2025/src/features/history/domain/entities/food_analysis_history.dart';
import 'package:nutri_ai_devfest2025/src/features/history/domain/repositories/food_analysis_history_repository.dart';

@LazySingleton(as: FoodAnalysisHistoryRepository)
class FoodAnalysisHistoryRepositoryImpl
    implements FoodAnalysisHistoryRepository {
  final LocalStorageDataSource _dataSource;

  FoodAnalysisHistoryRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, void>> saveFoodAnalysis(
    FoodAnalysisHistory historyItem,
  ) async {
    try {
      final historyModel = FoodAnalysisHistoryModel(
        imagePath: historyItem.imagePath,
        analysis: FoodAnalysisModel(
          foodName: historyItem.analysis.foodName,
          description: historyItem.analysis.description,
          calories: historyItem.analysis.calories,
          protein: historyItem.analysis.protein,
          fat: historyItem.analysis.fat,
          carbohydrates: historyItem.analysis.carbohydrates,
          micronutrients: historyItem.analysis.micronutrients,
          ingredients: historyItem.analysis.ingredients,
        ),
        date: historyItem.date,
      );
      final result = await _dataSource.addFoodAnalysisToHistory(historyModel);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure('Failed to save food analysis to history'));
    }
  }

  @override
  Future<Either<Failure, List<FoodAnalysisHistory>>>
  getFoodAnalysisHistory() async {
    try {
      final result = await _dataSource.getFoodAnalysisHistory();
      final history = result
          .map(
            (e) => FoodAnalysisHistory(
              imagePath: e.imagePath,
              analysis: e.analysis.toEntity(),
              date: e.date,
            ),
          )
          .toList();
      return Right(history);
    } catch (e) {
      return Left(CacheFailure('Failed to get food analysis history'));
    }
  }
}
