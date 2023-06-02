import 'package:demo1/counterApp.dart';
import 'package:flutter/material.dart';
import 'package:demo1/LoginPage.dart';
import 'package:demo1/chatScreen.dart';
import './utils/brandColors.dart';

void main() {
  runApp(chatApp());
}

class chatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "lorem",
        theme: ThemeData(
            primaryColor: brandColors.primarycolor,
            useMaterial3: true,
            appBarTheme: AppBarTheme(foregroundColor: Colors.black)),
        home: login(),
        routes: {
          '/login': (context) => login(),
          '/chat': (context) => chatscreen(),
        });
  }
}
