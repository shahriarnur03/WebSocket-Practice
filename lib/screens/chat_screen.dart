import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket_app/widgets/message_bubble.dart';
import '../controllers/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create GetX controller
    final controller = Get.put(ChatController());
    final textController = TextEditingController();

    // Connect to echo server
    controller.connect('wss://echo.websocket.org');

    return Scaffold(
      appBar: AppBar(title: Text('WebSocket Chat with GetX')),
      body: Column(
        children: [
          // Messages list - Obx makes it reactive
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(message: controller.messages[index]);
                },
              ),
            ),
          ),

          // Input area
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    controller.sendMessage(textController.text);
                    textController.clear();
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
