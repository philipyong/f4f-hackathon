import 'package:f4f_hackathon/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

import "../models/chat_log.dart";

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final List<ChatLog> _logs = [
    ChatLog(
      message: "Lorem ipsum",
      sender: "Nabil",
      timeSent: DateTime.now(),
    ),
    ChatLog(
      message: "This is another message",
      sender: "Nabil",
      timeSent: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff252525),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: _logs.length,
              itemBuilder: (_, index) {
                return ChatBubble(_logs[index]);
              },
            ),
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
