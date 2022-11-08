import 'package:get/get.dart';

class CartCostController extends GetxController {
  RxInt totalCost = 91.obs;

  void increment(value) => totalCost += value;
  void decrement(value) => totalCost -= value;
}
