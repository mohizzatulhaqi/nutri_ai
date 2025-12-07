import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/core/infra/infra.dart';
import 'package:nutri_ai_devfest2025/src/core/usecase/usecases.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/entities/food_analysis.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/domain/repositories/food_analysis_repository.dart';

@lazySingleton
class AnalyzeFoodImageUseCase implements UseCase<FoodAnalysis, Params> {
  final FoodAnalysisRepository _repository;

  AnalyzeFoodImageUseCase(this._repository);

  @override
  Future<Either<Failure, FoodAnalysis>> call(Params params) async {
    return await _repository.analyzeImage(
      params.imageBytes,
      params.languageCode,
    );
  }
}

class Params {
  final Uint8List imageBytes;
  final String languageCode;

  Params(this.imageBytes, this.languageCode);
}
