import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_11_assignment/screens/photo_list_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: PhotoListScreen(),
    );
  }
}
