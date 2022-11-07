import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Controller extends GetxController {
  int _indexPage = 0;

  get indexPage => _indexPage;

  void changeSelectedValue(int selectedValue) {
    _indexPage = selectedValue;
    update();
  }
}
