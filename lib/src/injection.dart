import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/features/history/data/models/food_analysis_history_model.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class InjectionModule {
  @lazySingleton
  Box<FoodAnalysisHistoryModel> get historyBox =>
      Hive.box<FoodAnalysisHistoryModel>('history');
}
