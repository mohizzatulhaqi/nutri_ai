import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/core/usecase/usecases.dart';
import 'package:nutri_ai_devfest2025/src/features/history/domain/domain.dart';
import 'package:nutri_ai_devfest2025/src/features/history/presentation/cubit/history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final GetFoodAnalysisHistoryUseCase _getFoodAnalysisHistoryUseCase;

  HistoryCubit(this._getFoodAnalysisHistoryUseCase)
    : super(const HistoryState.initial());

  void getHistory() async {
    emit(const HistoryState.loading());
    final result = await _getFoodAnalysisHistoryUseCase(NoParams());
    result.fold(
      (failure) => emit(HistoryState.error(failure.toString())),
      (history) => emit(HistoryState.loaded(history)),
    );
  }
}
