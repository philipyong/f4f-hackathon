import 'package:flutter/material.dart';

class CustAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;

  CustAppBar({required this.isHome});

  @override
  Size get preferredSize => Size.fromHeight(65.0);

  @override
  Widget build(BuildContext context) {
    Color bg = Color(0xFF6930C3);
    return AppBar(
      backgroundColor: bg,
      leading: (!isHome)
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          : null,
      actions: [
        InkWell(
          customBorder: new CircleBorder(),
          child: Container(
            margin: const EdgeInsets.only(top: 10.0, right: 10.0),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://miro.medium.com/fit/c/262/262/1*9VK9nJcSHO0uYeYwuFlGDA.jpeg"),
              ),
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              border: Border.all(color: Colors.white, width: 2.0),
            ),
          ),
          onTap: () {
            print("tapped");
          },
        ),
      ],
    );
  }
}
