// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get nutriAI => 'NutriAI';

  @override
  String get analysisPageTitle => 'NutriAI Food Analyzer';

  @override
  String get analysisPageDescription =>
      'Take a photo or upload an image of your food to get detailed nutritional analysis';

  @override
  String get analysisPageTakePhoto => 'Take a Photo';

  @override
  String get analysisPageChooseFromGallery => 'Choose from Gallery';

  @override
  String get analysisPageAnalyzing => 'Analyzing your food...';

  @override
  String get analysisPageAnalyzingDescription =>
      'Our AI is identifying ingredients and calculating nutrition facts';

  @override
  String get analysisPageRecommendation => 'Recommendation';

  @override
  String get analysisPageReason => 'Reason';

  @override
  String get analysisPageMacronutrients => 'Macronutrients';

  @override
  String get analysisPageCalories => 'Calories';

  @override
  String get analysisPageProtein => 'Protein';

  @override
  String get analysisPageCarbohydrates => 'Carbohydrates';

  @override
  String get analysisPageFat => 'Fat';

  @override
  String get analysisPageVitamins => 'Micronutrients';

  @override
  String get analysisPageIngredients => 'Ingredients';

  @override
  String get errorDialogTitle => 'An Error Occurred';

  @override
  String get errorDialogTryAgain => 'Try Again';

  @override
  String get historyPageTitle => 'History';

  @override
  String get historyPageNoHistory => 'No history yet.';

  @override
  String get wikifoodPageTitle => 'Wikifood';

  @override
  String get wikifoodPageSearchHint =>
      'Enter your food preference (e.g., diabetes friendly)';

  @override
  String get wikifoodPageSearch => 'Search';

  @override
  String get wikifoodPageInitial =>
      'Enter a preference and search for recommendations.';

  @override
  String get wikifoodPageDescription =>
      'Discover personalized food recommendations based on your preferences and health needs.';

  @override
  String get wikifoodPageSearchPlaceholder =>
      'Search for foods and get personalized recommendations';

  @override
  String get wikifoodPageSearching => 'Finding recommendations...';

  @override
  String get wikifoodPageCaloriesUnit => 'kcal';

  @override
  String get wikifoodPageProteinUnit => 'g protein';

  @override
  String get wikifoodPageErrorMessage => 'Oops! Something went wrong';

  @override
  String get homePageAnalyzer => 'Analyzer';

  @override
  String get homePageWikifood => 'Wikifood';

  @override
  String get homePageHistory => 'History';
}
