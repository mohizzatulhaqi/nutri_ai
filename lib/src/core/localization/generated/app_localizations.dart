import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @nutriAI.
  ///
  /// In en, this message translates to:
  /// **'NutriAI'**
  String get nutriAI;

  /// No description provided for @analysisPageTitle.
  ///
  /// In en, this message translates to:
  /// **'NutriAI Food Analyzer'**
  String get analysisPageTitle;

  /// No description provided for @analysisPageDescription.
  ///
  /// In en, this message translates to:
  /// **'Take a photo or upload an image of your food to get detailed nutritional analysis'**
  String get analysisPageDescription;

  /// No description provided for @analysisPageTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a Photo'**
  String get analysisPageTakePhoto;

  /// No description provided for @analysisPageChooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get analysisPageChooseFromGallery;

  /// No description provided for @analysisPageAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing your food...'**
  String get analysisPageAnalyzing;

  /// No description provided for @analysisPageAnalyzingDescription.
  ///
  /// In en, this message translates to:
  /// **'Our AI is identifying ingredients and calculating nutrition facts'**
  String get analysisPageAnalyzingDescription;

  /// No description provided for @analysisPageRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Recommendation'**
  String get analysisPageRecommendation;

  /// No description provided for @analysisPageReason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get analysisPageReason;

  /// No description provided for @analysisPageMacronutrients.
  ///
  /// In en, this message translates to:
  /// **'Macronutrients'**
  String get analysisPageMacronutrients;

  /// No description provided for @analysisPageCalories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get analysisPageCalories;

  /// No description provided for @analysisPageProtein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get analysisPageProtein;

  /// No description provided for @analysisPageCarbohydrates.
  ///
  /// In en, this message translates to:
  /// **'Carbohydrates'**
  String get analysisPageCarbohydrates;

  /// No description provided for @analysisPageFat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get analysisPageFat;

  /// No description provided for @analysisPageVitamins.
  ///
  /// In en, this message translates to:
  /// **'Micronutrients'**
  String get analysisPageVitamins;

  /// No description provided for @analysisPageIngredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get analysisPageIngredients;

  /// No description provided for @errorDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'An Error Occurred'**
  String get errorDialogTitle;

  /// No description provided for @errorDialogTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get errorDialogTryAgain;

  /// No description provided for @historyPageTitle.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyPageTitle;

  /// No description provided for @historyPageNoHistory.
  ///
  /// In en, this message translates to:
  /// **'No history yet.'**
  String get historyPageNoHistory;

  /// No description provided for @wikifoodPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Wikifood'**
  String get wikifoodPageTitle;

  /// No description provided for @wikifoodPageSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your food preference (e.g., diabetes friendly)'**
  String get wikifoodPageSearchHint;

  /// No description provided for @wikifoodPageSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get wikifoodPageSearch;

  /// No description provided for @wikifoodPageInitial.
  ///
  /// In en, this message translates to:
  /// **'Enter a preference and search for recommendations.'**
  String get wikifoodPageInitial;

  /// No description provided for @wikifoodPageDescription.
  ///
  /// In en, this message translates to:
  /// **'Discover personalized food recommendations based on your preferences and health needs.'**
  String get wikifoodPageDescription;

  /// No description provided for @wikifoodPageSearchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search for foods and get personalized recommendations'**
  String get wikifoodPageSearchPlaceholder;

  /// No description provided for @wikifoodPageSearching.
  ///
  /// In en, this message translates to:
  /// **'Finding recommendations...'**
  String get wikifoodPageSearching;

  /// No description provided for @wikifoodPageCaloriesUnit.
  ///
  /// In en, this message translates to:
  /// **'kcal'**
  String get wikifoodPageCaloriesUnit;

  /// No description provided for @wikifoodPageProteinUnit.
  ///
  /// In en, this message translates to:
  /// **'g protein'**
  String get wikifoodPageProteinUnit;

  /// No description provided for @wikifoodPageErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong'**
  String get wikifoodPageErrorMessage;

  /// No description provided for @homePageAnalyzer.
  ///
  /// In en, this message translates to:
  /// **'Analyzer'**
  String get homePageAnalyzer;

  /// No description provided for @homePageWikifood.
  ///
  /// In en, this message translates to:
  /// **'Wikifood'**
  String get homePageWikifood;

  /// No description provided for @homePageHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get homePageHistory;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
