import 'package:equatable/equatable.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/entities/food_analysis.dart';

class FoodAnalysisHistory extends Equatable {
  final String imagePath;
  final FoodAnalysis analysis;
  final DateTime date;

  const FoodAnalysisHistory({
    required this.imagePath,
    required this.analysis,
    required this.date,
  });

  @override
  List<Object?> get props => [imagePath, analysis, date];
}
