import 'package:get/get.dart';

class CartCostController extends GetxController {
  RxInt totalCost = 0.obs;

  void changeCost(value) {
    totalCost = value;
  }
}
