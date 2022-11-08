import 'package:get/get.dart';

class CartCostController extends GetxController {
  RxInt totalCost = 91.obs;

  void increment(value) => totalCost += value.round();
  void decrement(value) => totalCost -= value.round();
}
