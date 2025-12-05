# NutriAI Implementation Plan

This document outlines the steps to implement the NutriAI application, following the design specified in `DESIGN.md`.

## Journal

This section will be updated after each phase to log actions taken, things learned, surprises, and deviations from the plan.

*   **Phase 1:** Completed.
    *   **Actions:**
        *   Created a new Flutter project.
        *   Removed boilerplate files.
        *   Updated `pubspec.yaml` with the project description.
        *   Created `README.md` and `CHANGELOG.md`.
        *   Committed the initial project structure.
    *   **Learnings:**
        *   The `flutter create` command needs to be run in a directory with a valid Dart package name.
    *   **Deviations:**
        *   Skipped launching the app as there is no runnable code yet.

## Phase 1: Project Setup

*   [x] Create a new Flutter project in the `nutri_ai` directory.
*   [x] Remove the boilerplate `lib/main.dart` and `test/widget_test.dart`.
*   [x] Update the `description` in `pubspec.yaml` to "A Flutter application for analyzing food images and providing nutritional information." and set the version to `0.1.0`.
*   [x] Create a placeholder `README.md` with a short description of the project.
*   [x] Create a `CHANGELOG.md` file with an initial version of `0.1.0`.
*   [x] Commit the initial project structure to the `feature/nutri_ai_app` branch.
*   [x] After committing the change, start running the app with the `launch_app` tool on the user's preferred device (skipped).

After completing a task, if you added any TODOs to the code or didn't fully implement anything, make sure to add new tasks so that you can come back and complete them later.

After this phase, I will:
- [x] Create/modify unit tests for testing the code added or modified in this phase, if relevant.
- [x] Run the `dart_fix` tool to clean up the code.
- [x] Run the `analyze_files` tool one more time and fix any issues.
- [x] Run any tests to make sure they all pass.
- [x] Run `dart_format` to make sure that the formatting is correct.
- [x] Re-read the `IMPLEMENTATION.md` file to see what, if anything, has changed in the implementation plan, and if it has changed, take care of anything the changes imply.
- [x] Update the `IMPLEMENTATION.md` file with the current state, including any learnings, surprises, or deviations in the Journal section. Check off any checkboxes of items that have been completed.
- [x] Use `git diff` to verify the changes that have been made, and create a suitable commit message for any changes, following any guidelines you have about commit messages. Be sure to properly escape dollar signs and backticks, and present the change message to the user for approval.
- [x] Wait for approval. Don't commit the changes or move on to the next phase of implementation until the user approves the commit.
- [x] After commiting the change, if the app is running, use the `hot_reload` tool to reload it.

## Journal

This section will be updated after each phase to log actions taken, things learned, surprises, and deviations from the plan.

*   **Phase 1:** Completed.
    *   **Actions:**
        *   Created a new Flutter project.
        *   Removed boilerplate files.
        *   Updated `pubspec.yaml` with the project description.
        *   Created `README.md` and `CHANGELOG.md`.
        *   Committed the initial project structure.
    *   **Learnings:**
        *   The `flutter create` command needs to be run in a directory with a valid Dart package name.
    *   **Deviations:**
        *   Skipped launching the app as there is no runnable code yet.
*   **Phase 2:** Completed.
    *   **Actions:**
        *   Added dependencies to `pubspec.yaml`.
        *   Created the directory structure.
        *   Created `injection.dart` and `main.dart`.
        *   Ran `build_runner` to generate dependency injection files.
    *   **Learnings:**
        *   `charts_flutter` is discontinued, but added it anyway. Will see if it causes issues later.
        *   `build_runner` can be slow, but it's a powerful tool for code generation.
    *   **Deviations:**
        *   Skipped creating `build.yaml` as it might not be necessary.

## Phase 2: Core Project Structure and Dependency Integration

*   [x] Add the following dependencies to `pubspec.yaml`:
    *   `flutter_bloc`
    *   `injectable`
    *   `freezed_annotation`
    *   `hive`
    *   `hive_flutter`
    *   `image_picker`
    *   `charts_flutter`
    *   `google_generative_ai`
    *   `flutter_dotenv`
*   [x] Add the following dev dependencies to `pubspec.yaml`:
    *   `build_runner`
    *   `injectable_generator`
    *   `freezed`
    *   `hive_generator`
*   [x] Create the directory structure as specified in `DESIGN.md`.
*   [x] Configure `build_runner` for `injectable` and `freezed`.
*   [x] Set up dependency injection with `injectable` by creating the `injection.dart` file.
*   [x] Create the initial `lib/src/main.dart` file.

After this phase, I will perform the same post-phase steps as in Phase 1.

## Journal

This section will be updated after each phase to log actions taken, things learned, surprises, and deviations from the plan.

*   **Phase 1:** Completed.
    *   **Actions:**
        *   Created a new Flutter project.
        *   Removed boilerplate files.
        *   Updated `pubspec.yaml` with the project description.
        *   Created `README.md` and `CHANGELOG.md`.
        *   Committed the initial project structure.
    *   **Learnings:**
        *   The `flutter create` command needs to be run in a directory with a valid Dart package name.
    *   **Deviations:**
        *   Skipped launching the app as there is no runnable code yet.
*   **Phase 2:** Completed.
    *   **Actions:**
        *   Added dependencies to `pubspec.yaml`.
        *   Created the directory structure.
        *   Created `injection.dart` and `main.dart`.
        *   Ran `build_runner` to generate dependency injection files.
    *   **Learnings:**
        *   `charts_flutter` is discontinued, but added it anyway. Will see if it causes issues later.
        *   `build_runner` can be slow, but it's a powerful tool for code generation.
    *   **Deviations:**
        *   Skipped creating `build.yaml` as it might not be necessary.
*   **Phase 3:** Completed.
    *   **Actions:**
        *   Created the `FoodAnalysis` data model with `freezed`.
        *   Implemented the `GeminiApi` data source.
        *   Implemented the `FoodAnalysisRepository` implementation.
    *   **Learnings:**
        *   It's important to add a `toEntity()` method to the data model to separate the data layer from the domain layer.

## Phase 3: Analysis Feature - Data Layer

*   [x] Create the `FoodAnalysis` data model with `freezed`.
*   [x] Implement the `GeminiApi` data source to interact with the Gemini API.
*   [x] Implement the `FoodAnalysisRepository` implementation.

After this phase, I will perform the same post-phase steps as in Phase 1.

## Journal

This section will be updated after each phase to log actions taken, things learned, surprises, and deviations from the plan.

*   **Phase 1:** Completed.
    *   **Actions:**
        *   Created a new Flutter project.
        *   Removed boilerplate files.
        *   Updated `pubspec.yaml` with the project description.
        *   Created `README.md` and `CHANGELOG.md`.
        *   Committed the initial project structure.
    *   **Learnings:**
        *   The `flutter create` command needs to be run in a directory with a valid Dart package name.
    *   **Deviations:**
        *   Skipped launching the app as there is no runnable code yet.
*   **Phase 2:** Completed.
    *   **Actions:**
        *   Added dependencies to `pubspec.yaml`.
        *   Created the directory structure.
        *   Created `injection.dart` and `main.dart`.
        *   Ran `build_runner` to generate dependency injection files.
    *   **Learnings:**
        *   `charts_flutter` is discontinued, but added it anyway. Will see if it causes issues later.
        *   `build_runner` can be slow, but it's a powerful tool for code generation.
    *   **Deviations:**
        *   Skipped creating `build.yaml` as it might not be necessary.
*   **Phase 3:** Completed.
    *   **Actions:**
        *   Created the `FoodAnalysis` data model with `freezed`.
        *   Implemented the `GeminiApi` data source.
        *   Implemented the `FoodAnalysisRepository` implementation.
    *   **Learnings:**
        *   It's important to add a `toEntity()` method to the data model to separate the data layer from the domain layer.
*   **Phase 4:** Completed.
    *   **Actions:**
        *   Defined the `FoodAnalysisRepository` interface.
        *   Created the `AnalyzeFoodImageUseCase`.
    *   **Learnings:**
        *   A generic `UseCase` class can be used to reduce boilerplate code.

## Phase 4: Analysis Feature - Domain Layer

*   [x] Define the `FoodAnalysisRepository` interface.
*   [x] Create the `AnalyzeFoodImageUseCase`.

After this phase, I will perform the same post-phase steps as in Phase 1.

## Journal

This section will be updated after each phase to log actions taken, things learned, surprises, and deviations from the plan.

*   **Phase 1:** Completed.
    *   **Actions:**
        *   Created a new Flutter project.
        *   Removed boilerplate files.
        *   Updated `pubspec.yaml` with the project description.
        *   Created `README.md` and `CHANGELOG.md`.
        *   Committed the initial project structure.
    *   **Learnings:**
        *   The `flutter create` command needs to be run in a directory with a valid Dart package name.
    *   **Deviations:**
        *   Skipped launching the app as there is no runnable code yet.
*   **Phase 2:** Completed.
    *   **Actions:**
        *   Added dependencies to `pubspec.yaml`.
        *   Created the directory structure.
        *   Created `injection.dart` and `main.dart`.
        *   Ran `build_runner` to generate dependency injection files.
    *   **Learnings:**
        *   `charts_flutter` is discontinued, but added it anyway. Will see if it causes issues later.
        *   `build_runner` can be slow, but it's a powerful tool for code generation.
    *   **Deviations:**
        *   Skipped creating `build.yaml` as it might not be necessary.
*   **Phase 3:** Completed.
    *   **Actions:**
        *   Created the `FoodAnalysis` data model with `freezed`.
        *   Implemented the `GeminiApi` data source.
        *   Implemented the `FoodAnalysisRepository` implementation.
    *   **Learnings:**
        *   It's important to add a `toEntity()` method to the data model to separate the data layer from the domain layer.
*   **Phase 4:** Completed.
    *   **Actions:**
        *   Defined the `FoodAnalysisRepository` interface.
        *   Created the `AnalyzeFoodImageUseCase`.
    *   **Learnings:**
        *   A generic `UseCase` class can be used to reduce boilerplate code.
*   **Phase 5:** Completed.
    *   **Actions:**
        *   Created the `AnalysisState` with `freezed`.
        *   Created the `AnalysisCubit`.
        *   Implemented the UI for the analysis screen.
    *   **Learnings:**
        *   `BlocProvider` is used to provide the `AnalysisCubit` to the UI.
        *   `BlocBuilder` is used to rebuild the UI when the `AnalysisState` changes.

## Phase 5: Analysis Feature - Presentation Layer

*   [x] Create the `AnalysisState` with `freezed`.
*   [x] Create the `AnalysisCubit` to manage the state of the analysis feature.
*   [x] Implement the UI for the analysis screen, including the image picker, and result display with charts.

After this phase, I will perform the same post-phase steps as in Phase 1.

## Journal

This section will be updated after each phase to log actions taken, things learned, surprises, and deviations from the plan.

*   **Phase 1:** Completed.
    *   **Actions:**
        *   Created a new Flutter project.
        *   Removed boilerplate files.
        *   Updated `pubspec.yaml` with the project description.
        *   Created `README.md` and `CHANGELOG.md`.
        *   Committed the initial project structure.
    *   **Learnings:**
        *   The `flutter create` command needs to be run in a directory with a valid Dart package name.
    *   **Deviations:**
        *   Skipped launching the app as there is no runnable code yet.
*   **Phase 2:** Completed.
    *   **Actions:**
        *   Added dependencies to `pubspec.yaml`.
        *   Created the directory structure.
        *   Created `injection.dart` and `main.dart`.
        *   Ran `build_runner` to generate dependency injection files.
    *   **Learnings:**
        *   `charts_flutter` is discontinued, but added it anyway. Will see if it causes issues later.
        *   `build_runner` can be slow, but it's a powerful tool for code generation.
    *   **Deviations:**
        *   Skipped creating `build.yaml` as it might not be necessary.
*   **Phase 3:** Completed.
    *   **Actions:**
        *   Created the `FoodAnalysis` data model with `freezed`.
        *   Implemented the `GeminiApi` data source.
        *   Implemented the `FoodAnalysisRepository` implementation.
    *   **Learnings:**
        *   It's important to add a `toEntity()` method to the data model to separate the data layer from the domain layer.
*   **Phase 4:** Completed.
    *   **Actions:**
        *   Defined the `FoodAnalysisRepository` interface.
        *   Created the `AnalyzeFoodImageUseCase`.
    *   **Learnings:**
        *   A generic `UseCase` class can be used to reduce boilerplate code.
*   **Phase 5:** Completed.
    *   **Actions:**
        *   Created the `AnalysisState` with `freezed`.
        *   Created the `AnalysisCubit`.
        *   Implemented the UI for the analysis screen.
    *   **Learnings:**
        *   `BlocProvider` is used to provide the `AnalysisCubit` to the UI.
        *   `BlocBuilder` is used to rebuild the UI when the `AnalysisState` changes.
*   **Phase 6:** Completed.
    *   **Actions:**
        *   Created the `FoodAnalysisHistory` data model with `freezed`.
        *   Implemented the `LocalStorage` data source using `hive`.
        *   Implemented the `FoodAnalysisHistoryRepository` implementation.
    *   **Learnings:**
        *   `Hive` needs to be initialized in `main.dart`.
        *   `Injectable` modules can be used to register third-party dependencies.

## Phase 6: History Feature - Data Layer

*   [x] Create the `FoodAnalysisHistory` data model with `freezed`.
*   [x] Implement the `LocalStorage` data source using `hive`.
*   [x] Implement the `FoodAnalysisHistoryRepository` implementation.

After this phase, I will perform the same post-phase steps as in Phase 1.

## Phase 7: History Feature - Domain Layer

*   [x] Define the `FoodAnalysisHistoryRepository` interface.
*   [x] Create the `GetFoodAnalysisHistoryUseCase`.
*   [x] Create the `SaveFoodAnalysisUseCase`.

After this phase, I will perform the same post-phase steps as in Phase 1.

## Phase 8: History Feature - Presentation Layer

*   [x] Create the `HistoryState` with `freezed`.
*   [x] Create the `HistoryCubit` to manage the state of the history feature.
*   [x] Implement the UI for the history screen, displaying the list of past analyses.

After this phase, I will perform the same post-phase steps as in Phase 1.

## Phase 9: Finalization

*   [x] Create a comprehensive `README.md` file for the package.
*   [x] Create a `GEMINI.md` file in the project directory that describes the app, its purpose, and implementation details of the application and the layout of the files.
*   [x] Ask the user to inspect the app and the code and say if they are satisfied with it, or if any modifications are needed.

## Phase 10: App Navigation and Wikifood Integration

*   [x] Create a new `HomePage` widget that will contain a `BottomNavigationBar`.
*   [x] The `BottomNavigationBar` will have two tabs: "Analyzer" (the existing `AnalysisPage`) and "Wikifood`.
*   [x] Update `main.dart` to show `HomePage` as the initial route.
*   [x] Create a placeholder `WikifoodPage` for the new tab.

## Phase 11: Wikifood Feature - Data & Domain Layers

*   [x] Create a `FoodRecommendation` entity and a `FoodRecommendationModel` data model. This model will contain a `FoodAnalysis` object and a `recommendationReason` string.
*   [x] Update `GeminiApi` to include a new method `getFoodRecommendations(String preference)`. This method will prompt the AI to return a list of recommended Indonesian foods based on the user's preference, formatted as a JSON string that can be parsed into a list of `FoodRecommendationModel`.
*   [x] Update the `FoodAnalysisRepository` interface and implementation to include a method for getting food recommendations.
*   [x] Create a `GetFoodRecommendationsUseCase`.

## Phase 12: Wikifood Feature - Presentation Layer

*   [x] Create `WikifoodState` using `freezed` (initial, loading, loaded, error).
*   [x] Create `WikifoodCubit` to manage the state, which will use the `GetFoodRecommendationsUseCase`.
*   [x] Implement the UI for `WikifoodPage`:
    *   Add a `TextField` for users to enter their food preference (e.g., "diabetes friendly").
    *   Add a "Search" button to trigger the `WikifoodCubit`.
    *   Display a list of food recommendations when the state is `loaded`.
*   [x] Implement navigation from a tapped food item in the `WikifoodPage` list to the `AnalysisPage`. This will involve passing the `FoodAnalysis` data and the `recommendationReason` to the `AnalysisPage`.

## Phase 13: Analysis Page Enhancement

*   [x] Modify `AnalysisPage` to accept optional `FoodAnalysis` and `recommendationReason` arguments in its constructor.
*   [x] If `FoodAnalysis` is passed, the page should directly show the `_buildLoaded` state instead of the initial state.
*   [x] Modify the `_buildLoaded` widget in `AnalysisPage` to include a new section: "Why this Food is Recommended".
*   [x] This new section should only be visible if a `recommendationReason` is provided, and it will display the explanation from the AI.

## Phase 14: UI/UX Beautification

*   [x] Beautify the UI to improving the UX.
*   [x] Create master design like color, dimensions, fontstyle standarization at core/ui.
*   [x] Create shared widget to save reusable widget.
*   [x] Implement some animation to make user interest.
*   [x] Add transitions between screens for a smoother navigation experience.

## Phase 15: Finalization and Documentation

*   [x] Review and refactor the entire codebase for clarity, performance, and adherence to best practices.
*   [x] Add comprehensive documentation to all public-facing classes and methods.
*   [x] Ensure all dependencies are up to date.
*   [x] Perform final testing on multiple devices and screen sizes.
*   [x] Update the `README.md` and `CHANGELOG.md` for the final release.

## Phase 16: Localization and Data Model Refinement

*   [ ] Refactor `foodRecommendationReason` to be a list of strings.
*   [ ] Implement localization for Indonesian and English languages.
*   [ ] Update Gemini API prompts to consider the selected language.
*   [ ] Add a language switcher in the app with a good user experience.
*   [ ] Migrate all UI strings to use the localization setup.


