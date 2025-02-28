import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleVisionService {
  final String apiKey = "AIzaSyC5Mp79o-9VJ8pMQyPpREdLKfJeD6ZeQ8E";
  final String baseUrl = "https://vision.googleapis.com/v1/images:annotate";

  Future<Map<String, dynamic>?> detectTextFromImage(String imageUrl) async {
    final Uri url = Uri.parse("$baseUrl?key=$apiKey");

    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> body = {
      "requests": [
        {
          "image": {
            "source": {
              "imageUri": imageUrl,
            }
          },
          "features": [
            {
              "type": "TEXT_DETECTION",
            }
          ]
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
        return json.decode(response.body);
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
