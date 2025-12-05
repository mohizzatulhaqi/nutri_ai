import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/data/models/food_analysis_model.dart';

part 'food_analysis_history_model.freezed.dart';
part 'food_analysis_history_model.g.dart';

@freezed
@HiveType(typeId: 0)
class FoodAnalysisHistoryModel with _$FoodAnalysisHistoryModel {
  const factory FoodAnalysisHistoryModel({
    @HiveField(0) required String imagePath,
    @HiveField(1) required FoodAnalysisModel analysis,
    @HiveField(2) required DateTime date,
  }) = _FoodAnalysisHistoryModel;
}
