import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        toolbarHeight: 100,
        backgroundColor: Colors.teal,
        elevation: 20,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("that's setting page",
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}