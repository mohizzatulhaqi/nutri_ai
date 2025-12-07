import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/entities/food_analysis.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/usecases/analyze_food_image_usecase.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/presentation/cubit/analysis_state.dart';

@injectable
class AnalysisCubit extends Cubit<AnalysisState> {
  final AnalyzeFoodImageUseCase _analyzeFoodImageUseCase;

  AnalysisCubit(this._analyzeFoodImageUseCase)
    : super(const AnalysisState.initial());

  Future<void> analyzeImage(Uint8List imageBytes, String languageCode) async {
    debugPrint('Cubit: Starting image analysis...');
    emit(const AnalysisState.loading());
    final result = await _analyzeFoodImageUseCase(
      Params(imageBytes, languageCode),
    );
    result.fold(
      (failure) {
        final errorMessage = failure.toString();
        debugPrint('Cubit: Analysis failed: $errorMessage');
        emit(AnalysisState.error(message: errorMessage));
      },
      (foodAnalysis) {
        debugPrint('Cubit: Analysis successful: ${foodAnalysis.foodName}');
        emit(AnalysisState.loaded(foodAnalysis: foodAnalysis));
      },
    );
  }

  void reset() {
    debugPrint('Cubit: Resetting to initial state');
    emit(const AnalysisState.initial());
  }

  void setInitialAnalysis(FoodAnalysis analysis) {
    debugPrint('Cubit: Setting initial analysis: ${analysis.foodName}');
    emit(AnalysisState.loaded(foodAnalysis: analysis));
  }
}
