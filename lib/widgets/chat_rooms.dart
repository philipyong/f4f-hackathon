import 'package:f4f_hackathon/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '../../models/chatroomitems_list.dart';

class ChatListEx extends StatefulWidget {
  final String profileImgUrl;

  ChatListEx(this.profileImgUrl);

  @override
  _ChatListExState createState() => _ChatListExState();
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 3, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TrapezoidClipper oldClipper) => false;
}

class _ChatListExState extends State<ChatListEx> {
  List<Container> _buildListItems() {
    double boxHeight = MediaQuery.of(context).size.height * 0.1;
    double boxWidth = MediaQuery.of(context).size.width;

    String append(var sender, var message) {
      return ('$sender: $message');
    }

    return itemslist.map((item) {
      var container = Container(
        child: new Column(children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatScreen(this.widget.profileImgUrl, item.id),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 10, 10, 0),
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(item.banner),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerRight,
                ),
              ),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      item.roomName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: (boxHeight * 0.4),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      append(item.lastSender, item.lastMessage),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (boxHeight * 0.2),
                      ),
                    ),
                  ),
                ],
              ),
              height: boxHeight,
              width: boxWidth,
            ),
          ),
        ]),
      );
      return container;
    }).toList();
  }

  Widget build(BuildContext context) {
    return ListView(
      children: _buildListItems(),
    );
  }
}
