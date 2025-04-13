import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../data/api_services/gemini_chat_service.dart';
import '../../helpers/color_manager.dart';

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

    Future.delayed(Duration(milliseconds: 600), () {
      _getBotResponse(userMessage);
    });
  }

  Future<void> _getBotResponse(String userMessage) async {
    String botResponse = await _chatService.getBotResponse(userMessage);

    setState(() {
      _messages.add({"sender": "bot", "message": botResponse});
      _isSendingMessage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.gray80,
      appBar: AppBar(
        backgroundColor: ColorManager.secondary,
        title: Text("Financial Assistant", style: TextStyle(color: ColorManager.white)),
        iconTheme: IconThemeData(color: ColorManager.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 10),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUser = _messages[index]["sender"] == "user";
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      padding: EdgeInsets.all(12),
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                      decoration: BoxDecoration(
                        color: isUser ? ColorManager.secondary : ColorManager.gray70,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        _messages[index]["message"]!,
                        style: TextStyle(
                          color: isUser ? ColorManager.white : ColorManager.gray10,
                          fontSize: 14,
                        ),
                      ),
                    ).animate().fadeIn().slideX(begin: isUser ? 1.0 : -1.0).scaleXY(begin: 0.9, end: 1.0),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorManager.gray70,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (_) => _sendMessage(),
                      style: TextStyle(color: ColorManager.white),
                      decoration: InputDecoration(
                        hintText: "Ask about savings, budgets, and more...",
                        hintStyle: TextStyle(color: ColorManager.gray40, fontSize: 13),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: 300.ms,
                    child: _isSendingMessage
                        ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(ColorManager.secondary),
                      ),
                    )
                        : IconButton(
                      icon: Icon(Icons.send, color: ColorManager.secondary),
                      onPressed: _sendMessage,
                    ),
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
