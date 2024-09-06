import 'package:flutter/material.dart';
import 'package:flutter_tutorial/unit_test/counter/counter_controller.dart';
import 'package:get/get.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var counterController = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(title: const Text("Counter"),),
      body: Stack(
        children: [
          Obx(()=>Center(
            child: Text(counterController.value.value.toString()),
          )),
          Positioned(
            bottom: 10,
              right: 10,
              child: FloatingActionButton(onPressed: counterController.increment,child: const Icon(Icons.add),)),
          Positioned(
            bottom: 10,
              left: 10,
              child: FloatingActionButton(onPressed: counterController.decrement,child: const Icon(Icons.remove),)),
        ],
      ),
    );
  }
}
