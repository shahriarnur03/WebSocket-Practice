import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService {
  WebSocketChannel? channel;
  Function(String)? onMessageReceived;

  void connect(String serverUrl) {
    channel = WebSocketChannel.connect(Uri.parse(serverUrl));
    print('✅ Connected to WebSocket server: $serverUrl');

    channel?.stream.listen(
      (message) {
        print('📩 Message received: $message');
        if (onMessageReceived != null) {
          onMessageReceived!(message);
        }
      },
      onDone: () {
        print('❌ Connection closed by server');
      },
      onError: (error) {
        print('⚠️ Error: $error');
      },
    );
  }

  void sendMessage(String message) {
    channel?.sink.add(message);
    print('📤 Sent message: $message');
  }

  void disonnected() {
    channel?.sink.close();
    channel = null;
    print('🛑 Disconnected from WebSocket server');
  }
}
