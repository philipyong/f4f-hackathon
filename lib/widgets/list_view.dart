import 'package:flutter/material.dart';
import '../models/items_list.dart';

class ListViewEx extends StatefulWidget {
  @override
  _ListViewExState createState() => _ListViewExState();
}

class _ListViewExState extends State<ListViewEx> {
  @override
  List<Container> _buildListItems() {
    double length = itemslist.length * 1.0;
    double maxh = MediaQuery.of(context).size.height - 65.0;
    double itemh = 170.0;
    if (maxh / length > 170.0) itemh = maxh / length;
    return itemslist.map((item) {
      var container = Container(
        child: new Row(
          children: <Widget>[
            GestureDetector(
              child: Container(
                child: Center(
                  child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.black),
                        ],
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                ),
                height: itemh,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: new AssetImage(item.path), fit: BoxFit.fill),
                ),
              ),
              onTap: () {
                print("hello");
              },
            ),
          ],
        ),
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
