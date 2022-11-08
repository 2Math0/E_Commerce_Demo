import 'package:flutter_demo_task/controller/cart_controller.dart';
import 'package:flutter_demo_task/controller/cart_cost_controller.dart';
import 'package:flutter_demo_task/controller/controller.dart';
import 'package:get/get.dart';

import 'favourite_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
    Get.put<CartCostController>(CartCostController(), permanent: true);
    Get.put<FavouriteController>(FavouriteController(), permanent: true);
    Get.put<CartController>(CartController(), permanent: true);
  }
}
