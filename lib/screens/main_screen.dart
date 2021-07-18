import 'package:f4f_hackathon/screens/chat_list_screen.dart';
import 'package:f4f_hackathon/screens/chat_screen.dart';
import 'package:f4f_hackathon/widgets/chat_rooms.dart';
import 'package:f4f_hackathon/widgets/list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class MainScreen extends StatefulWidget {
  final String profileImgUrl;
  MainScreen(this.profileImgUrl);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton(
            underline: Container(),
            icon: Container(
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 10,
              ),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(this.widget.profileImgUrl),
                ),
              ),
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Quick Match',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(10),
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      backgroundColor: Colors.black,
                      appBar: AppBar(
                        actions: [
                          DropdownButton(
                            underline: Container(),
                            icon: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 10,
                              ),
                              child: CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      NetworkImage(this.widget.profileImgUrl),
                                ),
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.exit_to_app),
                                      SizedBox(width: 8),
                                      Text('Logout'),
                                    ],
                                  ),
                                ),
                                value: 'logout',
                              ),
                            ],
                            onChanged: (itemIdentifier) {
                              if (itemIdentifier == 'logout') {
                                FirebaseAuth.instance.signOut();
                              }
                            },
                          ),
                        ],
                      ),
                      body: Container(
                        width: double.infinity,
                        child: ListViewEx(),
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                'Specific Match',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(10),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatListScreen(this.widget.profileImgUrl),
            ),
          );
        },
        child: const Icon(Icons.message),
        backgroundColor: Theme.of(context).buttonColor,
      ),
    );
  }
}
