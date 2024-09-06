import 'package:get/get.dart';

class CounterController extends GetxController{
  var value = 0.obs;

  increment(){
    value++;
  }
  decrement(){
    value--;
  }
}