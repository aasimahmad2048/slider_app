import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  static Controller get to => Get.find();
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
        child: Column(
          children: [
            GetBuilder<Controller>(
              init: Controller(),
              builder: (s) => Column(
                children: [
                  Text('${s.counter}'),
                  Text("${Get.find<Controller>().counter}"),
                  Text("${Controller.to.counter}"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: GetBuilder<Controller>(builder: (s) => Text('${s.counter}')),
        onPressed: () => Get.find<Controller>().increment(),
      ),
    );
  }
}
