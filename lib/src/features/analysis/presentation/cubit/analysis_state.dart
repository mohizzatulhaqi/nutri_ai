import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/entities/food_analysis.dart';

part 'analysis_state.freezed.dart';

@freezed
class AnalysisState with _$AnalysisState {
  const factory AnalysisState.initial() = _Initial;
  const factory AnalysisState.loading() = _Loading;
  const factory AnalysisState.loaded({required FoodAnalysis foodAnalysis}) =
      _Loaded;
  const factory AnalysisState.error({required String message}) = _Error;
}
