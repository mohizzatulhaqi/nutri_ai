import 'package:dart_json_schema_prompt/dart_json_schema_prompt.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/core/services/gemini_ai_service.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/data/models/food_analysis_model.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/data/models/food_recommendation_model.dart';

abstract class GeminiApiDataSource {
  Future<FoodAnalysisModel> analyzeImage(Uint8List imageBytes);
  Future<List<FoodRecommendationModel>> getFoodRecommendations(
    String preference,
  );
}

@LazySingleton(as: GeminiApiDataSource)
class GeminiApiDataSourceImpl implements GeminiApiDataSource {
  final GeminiAiService _geminiService;

  GeminiApiDataSourceImpl(this._geminiService);

  @override
  Future<FoodAnalysisModel> analyzeImage(Uint8List imageBytes) async {
    throw UnimplementedError();

    // Step 1: Define the JSON schema structure for the AI response
    // This ensures the AI returns data in the exact format we need

    // Step 2: Generate the prompt text from the schema
    // This creates a formatted prompt that guides the AI to respond correctly

    // Step 3: Send the image and prompt to Gemini AI API

    // Step 4: Log the response received from the API

    // Step 5: Validate that we received a non-empty response

    // Step 6: Extract the JSON text from the response

    // Step 7: Parse the JSON response and convert to FoodAnalysisModel

    // Step 8: Handle JSON parsing errors
  }

  @override
  Future<List<FoodRecommendationModel>> getFoodRecommendations(
    String preference,
  ) async {
    try {
      debugPrint('Starting food recommendations for preference: $preference');

      // Generate JSON schema prompt for array of FoodRecommendationModel
      final schemaPrompt = JsonSchemaPrompt.forObjectArray(
        instruction:
            'Based on the preference "$preference", recommend 5 Indonesian foods. '
            'For each food, provide a nutritional analysis and a reason for the recommendation.',
        objectProperties: {
          'analysis': PropertyBuilder.object(
            description: 'Nutritional analysis of the food',
          ),
        },
        required: ['analysis'],
        additionalInstructions: [
          'The analysis object should contain:',
          '  - foodName: Name of the food item',
          '  - description: Brief description of the food',
          '  - calories: Calories per serving (number)',
          '  - protein: Protein in grams (number)',
          '  - fat: Fat in grams (number)',
          '  - carbohydrates: Carbohydrates in grams (number)',
          '  - micronutrients: Array of micronutrients',
          '  - ingredients: Array of main ingredients',
          '  - recommendationReason: Array of reasons for recommendation',
        ],
      );

      final promptText = JsonSchemaPrompt.generate(schemaPrompt);

      debugPrint('Sending request to Gemini API (Text)...');
      final response = await _geminiService.generateContentFromText(promptText);

      debugPrint('Response received from Gemini API');
      debugPrint('Response text: ${response.text}');

      if (response.text == null || response.text!.isEmpty) {
        debugPrint('Empty response from Gemini API');
        throw Exception('No response received from Gemini API');
      }

      String jsonText = response.text!;

      try {
        final parsedArray = JsonSchemaParser.parseObjectArray(jsonText);
        return parsedArray
            .map((item) => FoodRecommendationModel.fromJson(item))
            .toList();
      } catch (e) {
        debugPrint('Error parsing JSON: $e');
        throw Exception('Failed to parse food recommendations from response');
      }
    } catch (e) {
      debugPrint('Error in getFoodRecommendations: $e');
      rethrow;
    }
  }
}
