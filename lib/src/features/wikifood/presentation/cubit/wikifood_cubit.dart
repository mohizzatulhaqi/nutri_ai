import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/domain/usecases/get_food_recommendations_use_case.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/presentation/cubit/wikifood_state.dart';

@injectable
class WikifoodCubit extends Cubit<WikifoodState> {
  final GetFoodRecommendationsUseCase _getFoodRecommendationsUseCase;

  WikifoodCubit(this._getFoodRecommendationsUseCase)
    : super(const WikifoodState.initial());

  void search(String preference) async {
    emit(const WikifoodState.loading());
    final result = await _getFoodRecommendationsUseCase(preference);
    result.fold(
      (failure) => emit(WikifoodState.error(failure.toString())),
      (recommendations) => emit(WikifoodState.loaded(recommendations)),
    );
  }
}
