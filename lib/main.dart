
import 'package:flutter/material.dart';
import 'package:wedding_web_ui/screens/home_screen.dart';
import 'package:wedding_web_ui/screens/wellcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Gaela'
      ),
      home: WellComeScreen()
    );
  }
}

