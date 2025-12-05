import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/domain/entities/food_recommendation_entity.dart';

part 'wikifood_state.freezed.dart';

@freezed
class WikifoodState with _$WikifoodState {
  const factory WikifoodState.initial() = _Initial;
  const factory WikifoodState.loading() = _Loading;
  const factory WikifoodState.loaded(
    List<FoodRecommendationEntity> recommendations,
  ) = _Loaded;
  const factory WikifoodState.error(String message) = _Error;
}
