import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  int counter = 0;
  void increment() {
    counter++;
    update();
  }
}

void main() {
  runApp(GetMaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GetBuilder<CounterController>(
          init: CounterController(),
          builder: (s) => Text('${s.counter}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: GetBuilder<CounterController>(
          builder: (s) => Text('${s.counter}'),
        ),
        onPressed: () => Get.find<CounterController>().increment(),
      ),
    );
  }
}
