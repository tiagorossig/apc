import 'package:flutter/material.dart';
import 'package:apc_flutter/home.dart';

import 'impl/triangle_painter.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // brightness and colors
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,

        // text
        textTheme: TextTheme(
          subtitle1: TextStyle(fontFamily: "Avenir", color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400)
        )
      ),
      home: Home(),
      // routes for using Navigator.of(context).pushNamed("name")
      routes: <String, WidgetBuilder>{
        "Home": (BuildContext context) => Home(),
      }
    );
  }
}