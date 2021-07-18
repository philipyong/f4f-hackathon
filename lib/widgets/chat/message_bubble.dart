import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
    this.message,
    this.userName,
    this.userImage,
    this.isMe,
    this.dateCreated, {
    this.key,
  });

  final Key? key;
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;
  final String dateCreated;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment:
                    isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: !isMe
                    ? [
                        Column(
                          children: [
                            Text(
                              dateCreated,
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
                              child: Image.network(
                                userImage,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
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
                                  message,
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                userName,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "Quicksand",
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ]
                    : [
                        Column(
                          children: [
                            Text(
                              dateCreated,
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
                              child: Image.network(
                                userImage,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFC4C4C4),
                                ),
                                child: Text(
                                  message,
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                userName,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "Quicksand",
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ].reversed.toList(),
              ),
            ],
          ),
        ),
      ],
      clipBehavior: Clip.none,
    );
  }
}
