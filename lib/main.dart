import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket_app/screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WebSocket Chat with GetX',
      theme: ThemeData(primarySwatch: Colors.blue),
      
      home: const ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
