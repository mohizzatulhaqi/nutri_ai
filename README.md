# NutriAI

A Flutter application for analyzing food images and providing nutritional information.

## Features

- Analyze food images to get nutritional information.
- View a history of past analyses.
- Charts to visualize the nutritional data.

## Architecture

This project follows the Clean Architecture principles, separating the code into three layers:

- **Data:** Contains the data sources (API, local storage) and repository implementations.
- **Domain:** Contains the business logic, use cases, and repository interfaces.
- **Presentation:** Contains the UI, BLoC cubits, and states.

## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management.
- [injectable](https://pub.dev/packages/injectable) for dependency injection.
- [freezed](https://pub.dev/packages/freezed) for code generation for immutable classes.
- [hive](https://pub.dev/packages/hive) for local storage.
- [image_picker](https://pub.dev/packages/image_picker) for picking images from the gallery or camera.
- [charts_flutter](https://pub.dev/packages/charts_flutter) for displaying charts.
- [google_generative_ai](https://pub.dev/packages/google_generative_ai) for interacting with the Gemini API.
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) for managing environment variables.

## Getting Started

1.  Clone the repository.
2.  Create a `.env` file in the root of the project with the following content:

    ```
    GEMINI_API_KEY=<YOUR_GEMINI_API_KEY>
    ```

3.  Run `flutter pub get` to install the dependencies.
4.  Run `flutter run` to launch the application.
