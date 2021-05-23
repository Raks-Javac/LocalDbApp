import 'package:flutter/material.dart';
import 'package:sqliteapp/src/screens/TestHome.dart';

void main() {
  runApp(LocalDbApp());
}

class LocalDbApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local sqflite database App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestHome(),
    );
  }
}
