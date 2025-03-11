import 'package:flutter/material.dart';
import '../services/gemini_service.dart';

class ChatbotOverlay extends StatefulWidget {
  final VoidCallback onClose;

  const ChatbotOverlay({Key? key, required this.onClose}) : super(key: key);

  @override
  _ChatbotOverlayState createState() => _ChatbotOverlayState();
}

class _ChatbotOverlayState extends State<ChatbotOverlay> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  bool isLoading = false;

  void sendMessage() async {
    if (_controller.text.isEmpty) return;

    setState(() {
      messages.add({"user": _controller.text});
      isLoading = true;
    });

    String response = await GeminiService.getResponse(_controller.text);

    setState(() {
      messages.add({"bot": response});
      isLoading = false;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Material(
        // Add Material here
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectableText("Chatbot",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: widget.onClose, icon: Icon(Icons.close)),
                ],
              ),
              Expanded(
                child: ListView(
                  children: messages.map((msg) {
                    bool isUser = msg.containsKey("user");
                    return Align(
                      alignment:
                          isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.blue[100] : Colors.green[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            SelectableText(isUser ? msg["user"]! : msg["bot"]!),
                      ),
                    );
                  }).toList(),
                ),
              ),
              if (isLoading) CircularProgressIndicator(),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(hintText: "Ask something..."),
                      onSubmitted: (value) => sendMessage(),
                    ),
                  ),
                  IconButton(onPressed: sendMessage, icon: Icon(Icons.send)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
