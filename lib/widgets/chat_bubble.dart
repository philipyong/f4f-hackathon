import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "../models/chat_log.dart";

class ChatBubble extends StatelessWidget {
  final ChatLog log;

  ChatBubble(this.log);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    DateFormat("dd/mm/yyyy HH:mm").format(log.timeSent),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/images/profile-icon.png",
                      height: 80,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFC4C4C4),
                      ),
                      child: Text(
                        log.message,
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      log.sender,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Quicksand",
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
