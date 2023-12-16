import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basic/home_screen.dart';
import 'package:getx_basic/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(ThirdScreen());
      },
              child: const Text('Go to 3rd Screen'),
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
