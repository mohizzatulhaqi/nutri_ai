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
    try {
      // Step 1: Define the JSON schema structure for the AI response
      // This ensures the AI returns data in the exact format we need
      final schemaPrompt = JsonSchemaPrompt.forObject(
        instruction:
            'Analyze the food in this image and provide a nutritional analysis. '
            'Make reasonable estimates for a typical serving size.',
        properties: {
          'foodName': PropertyBuilder.string(
            description: 'Name of the food item',
          ),
          'description': PropertyBuilder.string(
            description: 'Brief description of the food',
          ),
          'calories': PropertyBuilder.number(
            description: 'Calories per serving',
            minimum: 0,
          ),
          'protein': PropertyBuilder.number(
            description: 'Protein in grams',
            minimum: 0,
          ),
          'fat': PropertyBuilder.number(
            description: 'Fat in grams',
            minimum: 0,
          ),
          'carbohydrates': PropertyBuilder.number(
            description: 'Carbohydrates in grams',
            minimum: 0,
          ),
          'micronutrients': PropertyBuilder.array(
            description: 'List of micronutrients present',
            items: PropertyBuilder.string(),
          ),
          'ingredients': PropertyBuilder.array(
            description: 'List of main ingredients',
            items: PropertyBuilder.string(),
          ),
        },
        required: [
          'foodName',
          'description',
          'calories',
          'protein',
          'fat',
          'carbohydrates',
          'micronutrients',
          'ingredients',
        ],
      );

      // Step 2: Generate the prompt text from the schema
      // This creates a formatted prompt that guides the AI to respond correctly
      final promptText = JsonSchemaPrompt.generate(schemaPrompt);

      // Step 3: Send the image and prompt to Gemini AI API
      debugPrint('Sending request to Gemini API (Vision)...');
      final response = await _geminiService.generateContentFromTextAndImage(
        promptText,
        imageBytes,
      );

      // Step 4: Log the response received from the API
      debugPrint('Response received from Gemini API');
      debugPrint('Response text: ${response.text}');

      // Step 5: Validate that we received a non-empty response
      if (response.text == null || response.text!.isEmpty) {
        debugPrint('Empty response from Gemini API');
        throw Exception('No response received from Gemini API');
      }

      // Step 6: Extract the JSON text from the response
      String jsonText = response.text!;

      // Step 7: Parse the JSON response and convert to FoodAnalysisModel
      try {
        // Parse the JSON string into a Map using the defined schema
        final parsedData = JsonSchemaParser.parseObject(
          jsonText,
          schema: schemaPrompt.schema,
        );
        // Convert the Map to our FoodAnalysisModel object
        return FoodAnalysisModel.fromJson(parsedData);
      } catch (e) {
        // Step 8: Handle JSON parsing errors
        debugPrint('Error parsing JSON: $e');
        throw Exception('Failed to parse nutritional analysis from response');
      }
    } catch (e) {
      // Step 9: Handle any errors that occur during the entire process
      debugPrint('Error in analyzeImage: $e');
      rethrow;
    }
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
