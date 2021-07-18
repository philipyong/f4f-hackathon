import 'package:f4f_hackathon/screens/auth_screen.dart';
import 'package:f4f_hackathon/screens/chat_screen.dart';
import 'package:f4f_hackathon/screens/main_screen.dart';
import 'package:f4f_hackathon/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _profileImgUrl =
      "https://miro.medium.com/fit/c/262/262/1*9VK9nJcSHO0uYeYwuFlGDA.jpeg";

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, appSnapshot) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              backgroundColor: Color(0xFF252525),
              accentColor: Color(0xFFC4C4C4),
              accentColorBrightness: Brightness.dark,
              scaffoldBackgroundColor: const Color(0xFFFF252525),
              buttonTheme: ButtonTheme.of(context).copyWith(
                buttonColor: Colors.deepPurple,
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              fontFamily: "Quicksand",
            ),
            home: appSnapshot.connectionState != ConnectionState.done
                ? SplashScreen()
                : StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (ctx, userSnapshot) {
                      if (userSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return SplashScreen();
                      }
                      if (userSnapshot.hasData) {
                        return MainScreen(_profileImgUrl);
                      }
                      return AuthScreen();
                    },
                  ),
          );
        });
  }
}
