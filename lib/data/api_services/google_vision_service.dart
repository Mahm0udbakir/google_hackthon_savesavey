import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GoogleVisionService {
  final String apiKey = "AIzaSyC5Mp79o-9VJ8pMQyPpREdLKfJeD6ZeQ8E";
  final String baseUrl = "https://vision.googleapis.com/v1/images:annotate";

  Future<String?> detectTextFromImage(File imageFile) async {
    final Uri url = Uri.parse("$baseUrl?key=$apiKey");

    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final String base64Image = base64Encode(imageFile.readAsBytesSync());

    final Map<String, dynamic> body = {
      "requests": [
        {
          "image": {"content": base64Image},
          "features": [{"type": "TEXT_DETECTION"}]
        }
      ]
    };

    try {
      final http.Response response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final extractedText = data["responses"][0]["textAnnotations"][0]["description"];
        return extractedText;
      } else {
        debugPrint("Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      debugPrint("Exception: $e");
      return null;
    }
  }
}
