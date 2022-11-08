import 'package:flutter_demo_task/controller/cart_cost_controller.dart';
import 'package:flutter_demo_task/controller/controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
    Get.put<CartCostController>(CartCostController(), permanent: true);
  }
}
