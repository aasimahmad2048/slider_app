import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller {
  RxInt count = RxInt(0);
  // Rx<Int> count = Rx<Int>(0 as Int);
  // int count = 0.obs as int;
  // var count = 0.obs;
  increment() {
    count++;
  }

  RxInt get sum => count++;
}

void main() {
  runApp(GetMaterialApp(home: Test()));
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    var user = User().obs;
    // on the controller file

    // when you need to update the user variable:
    // user.update((user) {
    //   // this parameter is the class itself that you want to update
    //   user?.name = 'Jonny' as RxString;
    //   user?.age = 18 as RxInt;
    // });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Obx(() => Text(user().name.value))),
          Center(child: Obx(() => Text(" this is age ${user().age}"))),
          Center(
            child: Obx(() => Text(" controller ${controller.count}")),
          ), // this is updating
          Center(
            child: Text("${controller.count.value}"),
          ), //  this will not update because i am not using obx function
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
          user().add();
        },
        child: Obx(() => Text("${controller.count.value}")),
      ),
    );
  }
}

// class User {
//   User({required String name, required int age});
//   var name;
//   var age;
// }

class User extends GetxController {
  User({String? name, int? age});
  var name = "".obs;
  var age = 0.obs;
  add() {
    age++;
  }
}
