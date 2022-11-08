import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaQueryController extends GetxController {
  Size size = const Size(0, 0);

  void init(BuildContext context) {
    size = MediaQuery.of(context).size;
  }
}
