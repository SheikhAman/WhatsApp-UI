import 'package:flutter/material.dart';
import 'package:myapp/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WhatsApp",
      theme: ThemeData(
          primaryColor: Color(0xff075e54),
          primaryColorLight: Color(0xff08d261)),
      home: HomeScreen(),
    );
  }
}
