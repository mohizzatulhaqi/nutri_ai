import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/core/infra/infra.dart';
import 'package:nutri_ai_devfest2025/src/core/usecase/usecases.dart';
import 'package:nutri_ai_devfest2025/src/features/history/domain/domain.dart';

@lazySingleton
class GetFoodAnalysisHistoryUseCase
    extends UseCase<List<FoodAnalysisHistory>, NoParams> {
  final FoodAnalysisHistoryRepository _repository;

  GetFoodAnalysisHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<FoodAnalysisHistory>>> call(NoParams params) {
    return _repository.getFoodAnalysisHistory();
  }
}
