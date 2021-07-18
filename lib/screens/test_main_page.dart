import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Insert K\'s banner here"),
          backgroundColor: const Color(0xff6930C3),
        ),
        backgroundColor: const Color(0xff252525),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 50.0),
              width: 300,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffC4C4C4),
              ),
              padding: EdgeInsets.all(25.0),
              child: Text(
                'QUICK MEET',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
            Container(
              width: 300,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffC4C4C4),
              ),
              padding: EdgeInsets.all(25.0),
              child: Text(
                'SPECIFIC MEET',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
