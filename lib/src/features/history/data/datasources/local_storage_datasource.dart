import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/features/history/data/models/food_analysis_history_model.dart';

abstract class LocalStorageDataSource {
  Future<void> addFoodAnalysisToHistory(FoodAnalysisHistoryModel historyItem);
  Future<List<FoodAnalysisHistoryModel>> getFoodAnalysisHistory();
}

@LazySingleton(as: LocalStorageDataSource)
class LocalStorageDataSourceImpl implements LocalStorageDataSource {
  final Box<FoodAnalysisHistoryModel> _historyBox;

  LocalStorageDataSourceImpl(this._historyBox);

  @override
  Future<void> addFoodAnalysisToHistory(
    FoodAnalysisHistoryModel historyItem,
  ) async {
    await _historyBox.add(historyItem);
  }

  @override
  Future<List<FoodAnalysisHistoryModel>> getFoodAnalysisHistory() async {
    return _historyBox.values.toList();
  }
}
