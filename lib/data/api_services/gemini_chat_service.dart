import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/material.dart';

class GeminiChatService {
  final GenerativeModel _model;

  GeminiChatService(String apiKey)
      : _model = GenerativeModel(model: 'gemini-2.5-pro-exp-03-25', apiKey: apiKey);

  Future<String> getBotResponse(String userMessage) async {
    try {
      final content = [Content.text(userMessage)];
      final response = await _model.generateContent(content);
      return response.text ?? "Sorry, I didn't understand that.";
    } catch (e) {
      debugPrint("Error calling Gemini API: $e");
      return "Sorry, there was an error processing your request.";
    }
  }
}
