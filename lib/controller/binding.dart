import 'package:flutter_demo_task/controller/controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Controller());
  }
}
