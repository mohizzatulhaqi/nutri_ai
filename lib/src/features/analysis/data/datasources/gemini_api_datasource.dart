import 'package:dart_json_schema_prompt/dart_json_schema_prompt.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:nutri_ai_devfest2025/src/core/services/gemini_ai_service.dart';
import 'package:nutri_ai_devfest2025/src/features/analysis/data/models/food_analysis_model.dart';
import 'package:nutri_ai_devfest2025/src/features/wikifood/data/models/food_recommendation_model.dart';

abstract class GeminiApiDataSource {
  Future<FoodAnalysisModel> analyzeImage(
    Uint8List imageBytes,
    String languageCode,
  );
  Future<List<FoodRecommendationModel>> getFoodRecommendations(
    String preference,
  );
}

@LazySingleton(as: GeminiApiDataSource)
class GeminiApiDataSourceImpl implements GeminiApiDataSource {
  final GeminiAiService _geminiService;

  GeminiApiDataSourceImpl(this._geminiService);

  @override
  Future<FoodAnalysisModel> analyzeImage(
    Uint8List imageBytes,
    String languageCode,
  ) async {
    try {
      debugPrint('Starting food image analysis...');

      // Step 1: Define JSON schema for FoodAnalysisModel
      // This ensures the AI returns data in the exact format we need
      final languageInstruction = languageCode == 'id'
          ? 'Use Indonesian language for all text fields (foodName, description, micronutrients, ingredients, etc).'
          : 'Use English language for all text fields (foodName, description, micronutrients, ingredients, etc).';

      final schemaPrompt = JsonSchemaPrompt.forObject(
        instruction:
            '''
You are a professional nutritionist

Analyze the given food image and return a VALID JSON object that strictly follows the schema.

RULES:
- Identify the food as accurately as possible.
- If the image is unclear, make the best possible estimation and clearly mention that it is an estimation in the description.
- All nutritional values must be realistic for ONE serving.
- Calories must be mathematically consistent with:
  - Protein (4 kcal/gram)
  - Carbohydrates (4 kcal/gram)
  - Fat (9 kcal/gram)
- Do NOT include explanations outside JSON.
- Do NOT use markdown.
- Do NOT wrap the JSON in backticks.
- Return ONLY pure JSON.

LANGUAGE:
${languageInstruction}
''',
        properties: {
          'foodName': PropertyBuilder.string(
            description: 'Exact or estimated name of the food',
          ),
          'description': PropertyBuilder.string(
            description:
                'Short explanation of the food, its origin, and visual characteristics',
          ),
          'calories': PropertyBuilder.number(
            description: 'Total calories per serving (kcal)',
            minimum: 0,
            maximum: 2000,
          ),
          'protein': PropertyBuilder.number(
            description: 'Protein in grams per serving',
            minimum: 0,
            maximum: 200,
          ),
          'fat': PropertyBuilder.number(
            description: 'Fat in grams per serving',
            minimum: 0,
            maximum: 200,
          ),
          'carbohydrates': PropertyBuilder.number(
            description: 'Carbohydrates in grams per serving',
            minimum: 0,
            maximum: 300,
          ),
          'micronutrients': PropertyBuilder.array(
            description: 'Important vitamins and minerals',
            items: PropertyBuilder.string(),
          ),
          'ingredients': PropertyBuilder.array(
            description: 'Main visible ingredients from the image',
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
        additionalInstructions: [
          'macronutrient values must be internally consistent with calories',
          'ingredients must only be based on what is visible or strongly implied',
          'micronutrients should be common and relevant to the food',
        ],
      );

      // Step 2: Generate prompt text
      // This creates a formatted prompt that guides the AI to respond correctly
      final promptText = JsonSchemaPrompt.generate(schemaPrompt);

      debugPrint('Sending image + prompt to Gemini API...');

      // Step 3: Send image & prompt to Gemini
      final response = await _geminiService.generateContentFromTextAndImage(
        promptText,
        imageBytes,
      );

      debugPrint('Response received from Gemini API');
      debugPrint('Response text: ${response.text}');

      // Step 4: Validate response
      if (response.text == null || response.text!.isEmpty) {
        debugPrint('Empty response from Gemini API');
        throw Exception('No response received from Gemini API');
      }

      final jsonText = response.text!;

      try {
        // Step 5: Parse JSON
        final parsedObject = JsonSchemaParser.parseObject(jsonText);

        // Step 6: Convert to model
        return FoodAnalysisModel.fromJson(parsedObject);
      } catch (e) {
        debugPrint('Error parsing JSON: $e');
        throw Exception('Failed to parse food analysis from response');
      }
    } catch (e) {
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
