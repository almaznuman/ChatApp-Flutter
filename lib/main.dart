import 'package:demo1/counterApp.dart';
import 'package:flutter/material.dart';
import 'package:demo1/LoginPage.dart';
import 'package:demo1/chatscreen.dart';

void main() {
  runApp(chatApp());
}

class chatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "lorem",
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.green,
            appBarTheme: AppBarTheme(foregroundColor: Colors.black)),
        home: login(),
        routes: {
          '/login': (context) => login(),
          '/chat': (context) => chatscreen(),
        });
  }
}
