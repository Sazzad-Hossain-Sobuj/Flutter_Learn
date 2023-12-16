import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'counter_state_controller.dart';
import 'home_screen.dart';


class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      initialBinding: GetxDependencyBinder(),
    );
  }
}
class GetxDependencyBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(CounterStateController());
  }
}