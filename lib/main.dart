import 'package:flutter/material.dart';
import 'pages.dart'; // this is where homepage is

final double version = 0.1;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Build " + version.toString(), // typecasting isnt automatic
      home: HomePage(),
    );
  }
}
