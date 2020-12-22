import 'package:covidapp/mainscreen.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MainScreen(),
    );
  }
}

