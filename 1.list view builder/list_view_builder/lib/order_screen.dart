import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_view_builder/setting%20screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

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
            Text("that's order page",
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),

            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
                child: Text('GoToSettings')),

            TextButton(onPressed: (){
              Navigator.pop(context);
            },
                child: Text('go back homepage')),
          ],
        ),
      ),
    );
  }
}