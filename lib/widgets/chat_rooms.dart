import 'package:flutter/material.dart';
import '../../models/chatroomitems_list.dart';

class ChatListEx extends StatefulWidget {
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
  @override
  List<Container> _buildListItems() {
    double box_height = MediaQuery.of(context).size.height * 0.1;
    double box_width = MediaQuery.of(context).size.width;

    String append(var sender, var message) {
      return ('$sender: $message');
    }

    return itemslist.map((item) {
      var container = Container(
        child: new Column(children: <Widget>[
          GestureDetector(
            onTap: null,
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
                        fontSize: (box_height * 0.4),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      append(item.lastSender, item.lastMessage),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (box_height * 0.2),
                      ),
                    ),
                  ),
                ],
              ),
              height: box_height,
              width: box_width,
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
