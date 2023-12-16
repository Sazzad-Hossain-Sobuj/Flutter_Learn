import 'package:get/get.dart';

class CounterStateController extends GetxController {
  int _count = 0;

  // RxInt get count{
  //   return _count;
  // }
  int get count => _count;

  void updateValue(int val){

    if(val < 0){
      _count = 0;
      update();
      return;
    }
    _count += val;
    update();
  }

}