import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/core/infra/infra.dart';
import 'package:nutri_ai_devfest2025/src/core/usecase/usecases.dart';
import 'package:nutri_ai_devfest2025/src/features/history/domain/domain.dart';

@lazySingleton
class SaveFoodAnalysisUseCase extends UseCase<void, FoodAnalysisHistory> {
  final FoodAnalysisHistoryRepository _repository;

  SaveFoodAnalysisUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(FoodAnalysisHistory params) {
    return _repository.saveFoodAnalysis(params);
  }
}
