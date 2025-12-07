import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

abstract class GeminiAiService {
  Future<GenerateContentResponse> generateContent(List<Content> content);
  Future<GenerateContentResponse> generateContentFromText(String text);
  Future<GenerateContentResponse> generateContentFromTextAndImage(
    String text,
    Uint8List imageBytes,
  );
}

@LazySingleton(as: GeminiAiService)
class GeminiAiServiceImpl implements GeminiAiService {
  final GenerativeModel _model;

  GeminiAiServiceImpl()
    : _model = GenerativeModel(
        model: 'gemini-2.5-flash',
        apiKey: dotenv.env['GEMINI_API_KEY']!,
      );

  @override
  Future<GenerateContentResponse> generateContent(List<Content> content) async {
    try {
      debugPrint('Sending request to Gemini API...');
      final response = await _model.generateContent(content);
      debugPrint('Response received from Gemini API');
      return response;
    } catch (e) {
      debugPrint('Error in generateContent: $e');
      rethrow;
    }
  }

  @override
  Future<GenerateContentResponse> generateContentFromText(String text) async {
    return generateContent([Content.text(text)]);
  }

  @override
  Future<GenerateContentResponse> generateContentFromTextAndImage(
    String text,
    Uint8List imageBytes,
  ) async {
    try {
      debugPrint('Sending text + image request to Gemini API...');

      // STEP 1: Create text part
      final textPart = TextPart(text);

      // STEP 2: Create image part (JPEG)
      final imagePart = DataPart('image/jpeg', imageBytes);

      // STEP 3: Combine into multi-part content
      final content = Content.multi([textPart, imagePart]);

      // STEP 4: Send to Gemini
      final response = await _model.generateContent([content]);

      debugPrint('Response received from Gemini API (Text + Image)');
      return response;
    } catch (e) {
      debugPrint('Error in generateContentFromTextAndImage: $e');
      rethrow;
    }
  }
}
