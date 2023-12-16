import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basic/home_screen.dart';
import 'package:getx_basic/second_screen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(SecondScreen());
              },
              child: const Text('Go to 2nd Screen'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Get.to(HomeScreen());
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
