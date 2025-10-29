import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:websocket_app/models/chat_mesage.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    final alignment = message.isMe
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
    final color = message.isMe ? Colors.blueAccent : Colors.grey[300];
    final textColor = message.isMe ? Colors.white : Colors.black87;
    final time = message.time;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message.text.trim(),
              style: TextStyle(color: textColor),
            ),
          ),
          Text(DateFormat('h:mm a').format(time)),
        ],
      ),
    );
  }
}
