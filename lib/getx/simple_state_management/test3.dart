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

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Provide the controller only once
//     final ctrl = Get.put(Controller());

//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // This listens to the SINGLE controller
//             GetBuilder<Controller>(
//               builder: (c) =>
//                   Text('${c.counter}', style: TextStyle(fontSize: 24)),
//             ),
//             // Direct access to the SINGLE controller
//             Text('${ctrl.counter}'),
//             Text('${Controller.to.counter}'),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: ctrl.increment,
//         child: GetBuilder<Controller>(builder: (c) => Text('${c.counter}')),
//       ),
//     );
//   }
// }
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GetBuilder<Controller>(
          builder: (c) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${c.counter}'),
              Text('${c.counter}'),
              Text('${c.counter}'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ctrl.increment,
        child: GetBuilder<Controller>(builder: (c) => Text('${c.counter}')),
      ),
    );
  }
}
