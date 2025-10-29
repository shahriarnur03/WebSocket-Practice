import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:websocket_app/models/chat_mesage.dart';

// Simple GetX Controller for WebSocket Chat
class ChatController extends GetxController {
  // Observable list of messages - this will automatically update UI
  final messages = <ChatMessage>[].obs;

  // WebSocket connection
  WebSocketChannel? _channel;

  // Connect to WebSocket server
  void connect(String serverUrl) {
    print('Connecting to: $serverUrl');

    _channel = WebSocketChannel.connect(Uri.parse(serverUrl));

    // Listen for messages from server
    _channel?.stream.listen((message) {
      print('Received: $message');
      // Add received message to list (this will update UI automatically)
      messages.add(
        ChatMessage(text: message, isMe: false, time: DateTime.now()),
      );
    });
  }

  // Send message to server
  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    // Add my message to list first
    messages.add(ChatMessage(text: text, isMe: true, time: DateTime.now()));

    // Send to server
    _channel?.sink.add(text);
    print('Sent: $text');
  }

  // Clean up when done
  @override
  void onClose() {
    _channel?.sink.close();
    super.onClose();
  }
}
