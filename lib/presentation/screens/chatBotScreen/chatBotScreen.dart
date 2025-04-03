import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../data/api_services/gemini_chat_service.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  ChatBotScreenState createState() => ChatBotScreenState();
}

class ChatBotScreenState extends State<ChatBotScreen> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  late GeminiChatService _chatService;

  bool _isSendingMessage = false;

  @override
  void initState() {
    super.initState();


    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception("API_KEY is missing from .env");
    }

    _chatService = GeminiChatService(apiKey);
  }

  void _sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.add({"sender": "user", "message": _controller.text});
      _isSendingMessage = true;
    });

    String userMessage = _controller.text;
    _controller.clear();

    // Simulate delay for bot's response
    Future.delayed(Duration(milliseconds: 1000), () {
      _getBotResponse(userMessage);
    });
  }

  Future<void> _getBotResponse(String userMessage) async {
    String botResponse = await _chatService.getBotResponse(userMessage);

    setState(() {
      _messages.add({"sender": "bot", "message": botResponse});
      _isSendingMessage = false; // Hide loading indicator after response
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Financial Assistant"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUser = _messages[index]["sender"] == "user";
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.green : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _messages[index]["message"]!,
                        style: TextStyle(color: isUser ? Colors.white : Colors.black),
                      ),
                    ).animate().fadeIn().scale(duration: 500.ms),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onSubmitted: (text) => _sendMessage(), // Trigger send on submit
                      controller: _controller,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 13
                        ),
                        hintText: "How can I help with your finances today?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: _isSendingMessage
                        ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    )
                        : Icon(Icons.send, color: Colors.green),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
